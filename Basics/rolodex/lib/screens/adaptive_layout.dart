import 'package:flutter/cupertino.dart';

import '../data/contact_group.dart';

// ============================================================
// RESPONSIVE CONFIGURATION
// ============================================================

const double largeScreenMinWidth = 600.0;
const double sidebarWidth = 300.0;

// ============================================================
// ADAPTIVE LAYOUT
// ============================================================

class AdaptiveLayout extends StatefulWidget {
  const AdaptiveLayout({super.key});

  @override
  State<AdaptiveLayout> createState() => _AdaptiveLayoutState();
}

class _AdaptiveLayoutState extends State<AdaptiveLayout> {
  late final ContactGroupsModel _contactGroupsModel;

  int selectedListId = 0;
  bool _showDetails = false;

  @override
  void initState() {
    super.initState();

    // Maintain a single model instance.
    _contactGroupsModel = ContactGroupsModel();
  }

  // ============================================================
  // NAVIGATION HANDLERS
  // ============================================================

  void _onContactListSelected(int listId) {
    setState(() {
      selectedListId = listId;
      _showDetails = true;
    });
  }

  void _onBackPressed() {
    setState(() {
      _showDetails = false;
    });
  }

  // ============================================================
  // ROOT RESPONSIVE BUILDER
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ContactGroup>>(
      valueListenable: _contactGroupsModel.listsNotifier,
      builder: (context, groups, child) {
        // Find the selected group using its actual ID.
        final selectedGroup = _contactGroupsModel.findContactList(
          selectedListId,
        );

        // Fallback if the selected group is unavailable.
        final currentGroup =
            selectedGroup ?? (groups.isNotEmpty ? groups.first : null);

        return LayoutBuilder(
          builder: (context, constraints) {
            final isLargeScreen = constraints.maxWidth >= largeScreenMinWidth;

            if (isLargeScreen) {
              return _buildLargeScreenLayout(groups, currentGroup);
            }

            return _buildSmallScreenLayout(groups, currentGroup);
          },
        );
      },
    );
  }

  // ============================================================
  // LARGE SCREEN LAYOUT
  // Sidebar + Contact Details
  // ============================================================

  Widget _buildLargeScreenLayout(
    List<ContactGroup> groups,
    ContactGroup? selectedGroup,
  ) {
    return CupertinoPageScaffold(
      // UPDATED: Adaptive iOS grouped background.
      backgroundColor: CupertinoColors.systemGroupedBackground,

      child: SafeArea(
        child: Row(
          children: [
            // ----------------------------------------------------
            // SIDEBAR
            // ----------------------------------------------------

            SizedBox(
              width: sidebarWidth,

              child: Container(
                // UPDATED: Secondary grouped surface.
                color: CupertinoColors.secondarySystemGroupedBackground,

                child: ContactGroupsPage(
                  groups: groups,
                  selectedListId: selectedGroup?.id ?? -1,
                  onListSelected: _onContactListSelected,
                ),
              ),
            ),

            // UPDATED: Subtle iOS-style vertical separator.
            Container(
              width: 0.5,
              color: CupertinoColors.separator.resolveFrom(context),
            ),

            // ----------------------------------------------------
            // DETAILS PANEL
            // ----------------------------------------------------
            Expanded(child: _buildDetailsPanel(selectedGroup)),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SMALL SCREEN LAYOUT
  // Contact Groups + Navigation
  // ============================================================

  Widget _buildSmallScreenLayout(
    List<ContactGroup> groups,
    ContactGroup? selectedGroup,
  ) {
    // NEW: Active Cupertino theme.
    final theme = CupertinoTheme.of(context);
    final textTheme = theme.textTheme;

    // UPDATED: Resolve adaptive navigation colors.
    final navigationBackground = CupertinoColors.systemBackground.resolveFrom(
      context,
    );

    final navigationBorder = CupertinoColors.separator.resolveFrom(context);

    // ----------------------------------------------------------
    // CONTACT DETAILS PAGE
    // ----------------------------------------------------------

    if (_showDetails && selectedGroup != null) {
      return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,

        navigationBar: CupertinoNavigationBar(
          // UPDATED: Native iOS navigation appearance.
          backgroundColor: navigationBackground,

          border: Border(
            bottom: BorderSide(color: navigationBorder, width: 0.5),
          ),

          middle: Text(
            selectedGroup.title,
            style: textTheme.navTitleTextStyle.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.label.resolveFrom(context),
            ),
          ),

          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 36,
            onPressed: _onBackPressed,

            child: Icon(
              CupertinoIcons.back,
              size: 23,
              color: theme.primaryColor,
            ),
          ),
        ),

        child: SafeArea(
          child: _buildDetailsPanel(selectedGroup, showHeader: false),
        ),
      );
    }

    // ----------------------------------------------------------
    // CONTACT GROUPS PAGE
    // ----------------------------------------------------------

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,

      navigationBar: CupertinoNavigationBar(
        backgroundColor: navigationBackground,

        border: Border(bottom: BorderSide(color: navigationBorder, width: 0.5)),

        middle: Text(
          'Contacts',
          style: textTheme.navTitleTextStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.label.resolveFrom(context),
          ),
        ),
      ),

      child: SafeArea(
        child: ContactGroupsPage(
          groups: groups,
          selectedListId: selectedGroup?.id ?? -1,
          onListSelected: _onContactListSelected,
        ),
      ),
    );
  }

  // ============================================================
  // CONTACT DETAILS PANEL
  // ============================================================

  Widget _buildDetailsPanel(ContactGroup? group, {bool showHeader = true}) {
    // NEW: Active typography configuration.
    final textTheme = CupertinoTheme.of(context).textTheme;

    // UPDATED: Resolve adaptive colors.
    final backgroundColor = CupertinoColors.systemBackground.resolveFrom(
      context,
    );

    final primaryTextColor = CupertinoColors.label.resolveFrom(context);

    final secondaryTextColor = CupertinoColors.secondaryLabel.resolveFrom(
      context,
    );

    final separatorColor = CupertinoColors.separator.resolveFrom(context);

    // ----------------------------------------------------------
    // EMPTY GROUP STATE
    // ----------------------------------------------------------

    if (group == null) {
      return Container(
        color: backgroundColor,

        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.person_2,
                size: 44,
                color: CupertinoColors.tertiaryLabel.resolveFrom(context),
              ),

              const SizedBox(height: 12),

              Text(
                'No contact groups available',
                style: textTheme.textStyle.copyWith(
                  fontSize: 15,
                  color: secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // ----------------------------------------------------------
    // CONTACT DETAILS CONTENT
    // ----------------------------------------------------------

    return Container(
      color: backgroundColor,

      // UPDATED: Responsive content padding.
      padding: EdgeInsets.symmetric(
        horizontal: showHeader ? 32 : 20,
        vertical: showHeader ? 32 : 20,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----------------------------------------------------
          // GROUP HEADER
          // ----------------------------------------------------

          if (showHeader) ...[
            Text(
              group.title,

              // UPDATED: iOS large title typography.
              style: textTheme.navLargeTitleTextStyle.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.7,
                color: primaryTextColor,
              ),
            ),

            const SizedBox(height: 8),
          ],

          // UPDATED: Contact count typography.
          Text(
            '${group.contacts.length} '
            '${group.contacts.length == 1 ? 'contact' : 'contacts'}',

            style: textTheme.textStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: secondaryTextColor,
            ),
          ),

          const SizedBox(height: 20),

          // UPDATED: Subtle horizontal separator.
          Container(height: 0.5, color: separatorColor),

          // ----------------------------------------------------
          // CONTACT LIST
          // ----------------------------------------------------
          Expanded(
            child: group.contacts.isEmpty
                // ------------------------------------------------
                // EMPTY CONTACT STATE
                // ------------------------------------------------
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.person_crop_circle_badge_plus,
                          size: 50,
                          color: CupertinoColors.tertiaryLabel.resolveFrom(
                            context,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Text(
                          'No contacts in this group',

                          style: textTheme.textStyle.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: secondaryTextColor,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          'Contacts added to this group will appear here.',

                          textAlign: TextAlign.center,

                          style: textTheme.textStyle.copyWith(
                            fontSize: 13,
                            color: CupertinoColors.tertiaryLabel.resolveFrom(
                              context,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                // ------------------------------------------------
                // CONTACT LIST VIEW
                // ------------------------------------------------
                : ListView.separated(
                    padding: const EdgeInsets.only(top: 8),

                    itemCount: group.contacts.length,

                    // UPDATED: iOS-style row separator.
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 54),

                        child: Container(height: 0.5, color: separatorColor),
                      );
                    },

                    itemBuilder: (context, index) {
                      final contact = group.contacts[index];

                      // Construct full contact name.
                      final fullName = [
                        contact.firstName,
                        if (contact.middleName != null &&
                            contact.middleName!.isNotEmpty)
                          contact.middleName!,
                        contact.lastName,
                      ].where((name) => name.isNotEmpty).join(' ');

                      // NEW: Handle empty contact names.
                      final displayName = fullName.isEmpty
                          ? 'Unnamed Contact'
                          : fullName;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 4,
                        ),

                        child: Row(
                          children: [
                            // ------------------------------------
                            // CONTACT AVATAR
                            // ------------------------------------

                            Container(
                              width: 42,
                              height: 42,

                              decoration: BoxDecoration(
                                color: CupertinoColors.tertiarySystemFill
                                    .resolveFrom(context),
                                shape: BoxShape.circle,
                              ),

                              child: Icon(
                                CupertinoIcons.person_fill,
                                size: 19,
                                color: CupertinoColors.secondaryLabel
                                    .resolveFrom(context),
                              ),
                            ),

                            const SizedBox(width: 14),

                            // ------------------------------------
                            // CONTACT NAME
                            // ------------------------------------
                            Expanded(
                              child: Text(
                                displayName,

                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,

                                style: textTheme.textStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: primaryTextColor,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ),

                            // NEW: Subtle iOS disclosure indicator.
                            Icon(
                              CupertinoIcons.chevron_right,
                              size: 14,
                              color: CupertinoColors.tertiaryLabel.resolveFrom(
                                context,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RESOURCE DISPOSAL
  // ============================================================

  @override
  void dispose() {
    // Dispose ValueNotifier resources.
    _contactGroupsModel.dispose();

    super.dispose();
  }
}
