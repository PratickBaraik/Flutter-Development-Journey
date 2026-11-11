
import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'contact.dart';

// ============================================================
// CONTACT GROUP MODEL
// ============================================================

class ContactGroup {
  factory ContactGroup({
    required int id,
    required String label,
    bool permanent = false,
    String? title,
    List<Contact>? contacts,
  }) {
    final contactsCopy = List<Contact>.of(contacts ?? []);
    _sortContacts(contactsCopy);

    return ContactGroup._internal(
      id: id,
      label: label,
      permanent: permanent,
      title: title,
      contacts: contactsCopy,
    );
  }

  ContactGroup._internal({
    required this.id,
    required this.label,
    this.permanent = false,
    String? title,
    List<Contact>? contacts,
  }) : title = title ?? label,
       _contacts = contacts ?? [];

  final int id;
  final bool permanent;
  final String label;
  final String title;
  final List<Contact> _contacts;

  List<Contact> get contacts => _contacts;

  // Alphabetical contact grouping based on last name.
  AlphabetizedContactMap get alphabetizedContacts {
    final contactsMap = AlphabetizedContactMap();

    for (final contact in _contacts) {
      final lastInitial = contact.lastName.isEmpty
          ? '#'
          : contact.lastName[0].toUpperCase();

      contactsMap.putIfAbsent(lastInitial, () => []).add(contact);
    }

    return contactsMap;
  }
}

typedef AlphabetizedContactMap = SplayTreeMap<String, List<Contact>>;

// ============================================================
// CONTACT SORTING
// ============================================================

void _sortContacts(List<Contact> contacts) {
  contacts.sort((a, b) {
    final lastNameComparison = a.lastName.compareTo(b.lastName);

    if (lastNameComparison != 0) {
      return lastNameComparison;
    }

    final firstNameComparison = a.firstName.compareTo(b.firstName);

    if (firstNameComparison != 0) {
      return firstNameComparison;
    }

    final middleA = a.middleName ?? '';
    final middleB = b.middleName ?? '';

    final middleNameComparison = middleA.compareTo(middleB);

    if (middleNameComparison != 0) {
      return middleNameComparison;
    }

    return a.id.compareTo(b.id);
  });
}

// ============================================================
// SEED CONTACT GROUPS
// ============================================================

final allPhone = ContactGroup(
  id: 0,
  permanent: true,
  label: 'All iPhone',
  title: 'iPhone',
  contacts: allContacts.toList(),
);

final friends = ContactGroup(
  id: 1,
  label: 'Friends',
  contacts: [allContacts.elementAt(3)],
);

final work = ContactGroup(
  id: 2,
  label: 'Work',
);

List<ContactGroup> generateSeedData() {
  return [allPhone, friends, work];
}

// ============================================================
// CONTACT GROUP STATE MANAGEMENT
// ============================================================

class ContactGroupsModel {
  ContactGroupsModel() : _listsNotifier = ValueNotifier(generateSeedData());

  final ValueNotifier<List<ContactGroup>> _listsNotifier;

  ValueNotifier<List<ContactGroup>> get listsNotifier => _listsNotifier;

  List<ContactGroup> get lists => _listsNotifier.value;

  ContactGroup? findContactList(int id) {
    for (final group in lists) {
      if (group.id == id) {
        return group;
      }
    }

    return null;
  }

  void dispose() {
    _listsNotifier.dispose();
  }
}

// ============================================================
// PUBLIC CONTACT GROUP PAGE
// ============================================================

class ContactGroupsPage extends StatelessWidget {
  const ContactGroupsPage({
    super.key,
    required this.groups,
    required this.selectedListId,
    required this.onListSelected,
  });

  final List<ContactGroup> groups;
  final int selectedListId;
  final ValueChanged<int> onListSelected;

  @override
  Widget build(BuildContext context) {
    return _ContactGroupsView(
      groups: groups,
      selectedListId: selectedListId,
      onListSelected: (group) {
        onListSelected(group.id);
      },
    );
  }
}

// ============================================================
// PRIVATE CONTACT GROUP UI
// ============================================================

class _ContactGroupsView extends StatelessWidget {
  const _ContactGroupsView({
    required this.groups,
    required this.selectedListId,
    required this.onListSelected,
  });

  final List<ContactGroup> groups;
  final int selectedListId;
  final ValueChanged<ContactGroup> onListSelected;

  @override
  Widget build(BuildContext context) {

    // NEW: Obtain typography from the active Cupertino theme.
    final textTheme = CupertinoTheme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // UPDATED: Sidebar heading.
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Groups',
                style: textTheme.navLargeTitleTextStyle.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.4,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                '${groups.length} groups',
                style: textTheme.textStyle.copyWith(
                  fontSize: 13,
                  color: CupertinoColors.secondaryLabel,
                ),
              ),
            ],
          ),
        ),

        // NEW: Subtle separator below the heading.
        Container(
          height: 0.5,
          color: CupertinoColors.separator,
        ),

        // Contact group list.
        Expanded(
          child: groups.isEmpty

              // UPDATED: Improved empty state.
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.folder,
                        size: 42,
                        color: CupertinoColors.tertiaryLabel,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'No contact groups available',
                        style: textTheme.textStyle.copyWith(
                          fontSize: 14,
                          color: CupertinoColors.secondaryLabel,
                        ),
                      ),
                    ],
                  ),
                )

              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  itemCount: groups.length,

                  itemBuilder: (context, index) {
                    final group = groups[index];
                    final isSelected = group.id == selectedListId;

                    // NEW: Adaptive selection background.
                    final backgroundColor = isSelected
                        ? CupertinoColors.systemBlue.withValues(alpha: 0.12)
                        : CupertinoColors.transparent;

                    final foregroundColor = isSelected
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.secondaryLabel;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),

                      // UPDATED: CupertinoButton provides native tap
                      // feedback and better accessibility.
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        pressedOpacity: 0.65,
                        onPressed: () => onListSelected(group),

                        child: Container(
                          width: double.infinity,

                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 13,
                          ),

                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Row(
                            children: [

                              // UPDATED: Group icon.
                              Icon(
                                group.permanent
                                    ? CupertinoIcons.person_2_fill
                                    : CupertinoIcons.person_2,
                                size: 21,
                                color: foregroundColor,
                              ),

                              const SizedBox(width: 13),

                              // Group information.
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    // UPDATED: Group label typography.
                                    Text(
                                      group.label,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,

                                      style: textTheme.textStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.w500,
                                        color: CupertinoColors.label,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    // UPDATED: Contact count.
                                    Text(
                                      '${group.contacts.length} '
                                      '${group.contacts.length == 1 ? 'contact' : 'contacts'}',

                                      style: textTheme.textStyle.copyWith(
                                        fontSize: 12,
                                        color: CupertinoColors.secondaryLabel,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 8),

                              // UPDATED: Selection indicator.
                              if (isSelected)
                                const Icon(
                                  CupertinoIcons.checkmark,
                                  size: 17,
                                  color: CupertinoColors.activeBlue,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
