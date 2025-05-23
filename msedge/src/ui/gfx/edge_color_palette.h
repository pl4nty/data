// Copyright (C) Microsoft Corporation. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef UI_GFX_EDGE_COLOR_PALETTE_H_
#define UI_GFX_EDGE_COLOR_PALETTE_H_

#include "third_party/skia/include/core/SkColor.h"

#define Gray(val) (SkColorSetRGB(val, val, val))

namespace gfx {
  namespace edge {

    // Basic Colors
    constexpr SkColor kBaseRed = SkColorSetARGB(0xFF, 0xCC, 0x00, 0x00);
    constexpr SkColor kBaseBlue = SkColorSetRGB(0x00, 0x78, 0xD4);
    constexpr SkColor kLightModeAccentBlue = kBaseBlue;
    constexpr SkColor kDarkModeAccentBlue = SkColorSetRGB(0x00, 0x6C, 0xBE);
    constexpr SkColor kLightModeAccentControlBorderBlue =
        SkColorSetRGB(0x1C, 0x79, 0xCA);
    constexpr SkColor kDarkModeAccentControlBorderBlue =
        SkColorSetRGB(0x7E, 0xD3, 0xFD);
    constexpr SkColor kBadgeBlueLightMode = SkColorSetRGB(0x00, 0x74, 0xCD);
    constexpr SkColor kBadgeBlueDarkMode = SkColorSetRGB(0x4C, 0x98, 0xD1);
    constexpr SkColor kBadgeRedLightMode = SkColorSetRGB(0xFF, 0x00, 0x00);
    constexpr SkColor kBadgeRedDarkMode = SkColorSetRGB(0xE9, 0x8F, 0x6D);
    constexpr SkColor kEdgeLightBlue = SkColorSetRGB(0x63, 0xAD, 0xE5);
    constexpr SkColor kEdgeLightYellow = SkColorSetRGB(0xFB, 0xF6, 0xD9);
    // Placeholder color in Edge. Hot Pink. Chosen because we do intentionally use
    // Red from time to time, which is the Chrome placeholder color.
    constexpr SkColor kEdgePlaceholderColor = SkColorSetRGB(255, 105, 180);

    // More Colors.
    // If one color is used in multiple ui's, create it using its
    // closest match of a named color, otherwise, create it using a ui-related
    // name.
    constexpr SkColor kEdgeDarkTransientBackgroundGray = Gray(0x4A);
    constexpr SkColor kEdgeDarkBackgroundGray = Gray(0x4E);
    constexpr SkColor kEdgeDoveGray = Gray(0x6F);
    constexpr SkColor kEdgeToolbarGray = Gray(0xF7);
    constexpr SkColor kEdgeWhiteSmoke = Gray(0xEF);

    // Color is used in nurturing infobar to set the background color of
    // buttons.
    constexpr SkColor kInfoBarLightModeColor = SkColorSetRGB(229, 229, 229);
    constexpr SkColor kInfoBarDarkModeColor = SkColorSetRGB(77, 77, 77);

    // Color is used to set the background color in WebUi.
    constexpr SkColor kColorEdgeBackgroundDialogDark =
        SkColorSetRGB(0x29, 0x29, 0x29);
    constexpr SkColor kColorEdgeBackgroundDialogLight =
        SkColorSetRGB(0xff, 0xff, 0xff);
    constexpr SkColor kColorEdgeLayerBackgroundBaseDark =
        SkColorSetRGB(0x33, 0x33, 0x33);
    constexpr SkColor kColorEdgeLayerBackgroundBaseLight =
        SkColorSetRGB(0xfa, 0xfa, 0xfa);

    // backgroundFlyoutSolid = 'var(--smtc-background-window-primary-solid)
    constexpr SkColor kColorEdgeSemanticLayerFlyoutBackgroundDialogDark =
        SkColorSetRGB(0X29, 0x29, 0x29);
    constexpr SkColor kColorEdgeSemanticLayerFlyoutBackgroundDialogLight =
        SkColorSetRGB(0xff, 0xff, 0xff);

    // backgroundWindowPrimarySolid = 'var(--smtc-background-flyout-solid)
    constexpr SkColor kColorEdgeSemanticLayerBackgroundBaseDark =
        SkColorSetRGB(0X29, 0x29, 0x29);
    constexpr SkColor kColorEdgeSemanticLayerBackgroundBaseLight =
        SkColorSetRGB(0xFF, 0xFF, 0xFF);

    // for background with cards:
    // backgroundLayerTertiary = 'var(--smtc-background-layer-tertiary)';
    constexpr SkColor kColorEdgeSemanticLayerCardContainerBackgroundDark =
        SkColorSetARGB(0x3D, 0x00, 0x00, 0x00);
    constexpr SkColor kColorEdgeSemanticLayerCardContainerBackgroundLight =
        SkColorSetARGB(0x05, 0x00, 0x00, 0x00);

    // The following set are different shades of grey based on
    // different alphas of black on a white background.
    constexpr SkColor kEdgeDarkGray = Gray(0x33); // Opaque value equivalent to 80% alpha black
    constexpr SkColor kEdgeMidDarkGray = Gray(0x66); // Opaque value equivalent to 60% alpha black
    constexpr SkColor kEdgeMidLightGray = Gray(0x99); // Opaque value equivalent to 40% alpha black
    constexpr SkColor kEdgeDarkFadedGray =
        Gray(0xAC);  // Opaque value equivalent to 32.5% alpha black
    constexpr SkColor kEdgeFadedGray = Gray(0xCC); // Opaque value equivalent to 20% alpha black
    constexpr SkColor kEdgeLightGray = Gray(0xE0); // Opaque value equivalent to 12% alpha black
    constexpr SkColor kEdgeLighterGray = Gray(0xE6);
    constexpr SkColor kEdgeReadableLightGray = Gray(0x76);

    constexpr SkColor kInPrivateDarkGray = SkColorSetARGB(0xFF, 0x47, 0x46, 0x45);
    constexpr SkColor kInPrivateLightGray = SkColorSetARGB(0xFF, 0xAB, 0xAB, 0xAA);

    // Default Material Colors
    constexpr SkColor kAcrylicTintColor = Gray(0xFC);
    constexpr float kAcrylicTintOpacity = 0;
    constexpr float kAcrylicLuminosityOpacity = 0.85f;
    constexpr SkColor kDarkAcrylicTintColor = Gray(0x2C);
    constexpr float kDarkAcrylicTintOpacity = 0.15f;
    constexpr float kDarkAcrylicLuminosityOpacity = 0.96f;
    constexpr SkColor kMicaTintColor = Gray(0xF3);
    constexpr float kMicaTintOpacity = 0.5f;
    constexpr float kMicaLuminosityOpacity = 1.f;
    constexpr SkColor kDarkMicaTintColor = Gray(0x20);
    constexpr float kDarkMicaTintOpacity = 0.8f;
    constexpr float kDarkMicaLuminosityOpacity = 1.f;
    constexpr SkColor kPhoenixToolbarDarkerGrayBlueTintColor =
        SkColorSetRGB(0xE6, 0xE8, 0xEB);
    constexpr SkColor kPhoenixChromeColor = SkColorSetRGB(0xDF, 0xE1, 0xE5);
    constexpr SkColor kPhoenixSemiTransparentToolbarColor =
        SkColorSetARGB(0xc8, 0xF7, 0xF7, 0xF7);

    // Phoenix: Connected tab Colors
    constexpr SkColor kPhoenixBlueTintA = SkColorSetRGB(0xDC, 0xDE, 0xE0);
    constexpr SkColor kPhoenixToolbarBlueTintColorA =
        SkColorSetRGB(0xF2, 0xF4, 0xF7);
    constexpr SkColor kPhoenixBlueTintB = SkColorSetRGB(0xE6, 0xE8, 0xEB);

    //Label Colors
    constexpr SkColor kDisabledLabel = SkColorSetRGB(0x72, 0x77, 0x7C);
    constexpr SkColor kDarkThemeDisabledLabel = Gray(0xB9);
    constexpr SkColor kEdgeDisabledStyleGray = Gray(0x9e);

    // Text Colors
    constexpr SkColor kDarkThemeDisabledText = SkColorSetRGB(0x89, 0x89, 0x88);
    constexpr SkColor kDarkThemeSecondaryText = Gray(0xA9);
    constexpr SkColor kDisabledText = kEdgeMidLightGray;
    constexpr SkColor kGhostText = kEdgeMidDarkGray;
    constexpr SkColor kPrimaryText = SK_ColorBLACK;
    constexpr SkColor kIdentitySubtitleText =
        SkColorSetARGB(0x99, 0x00, 0x00, 0x00);
    constexpr SkColor kInPrivatePrimaryText = SK_ColorWHITE;
    constexpr SkColor kLightTabText = SK_ColorBLACK;
    constexpr SkColor kLightInactiveTabText = Gray(0x33);
    constexpr SkColor kDarkTabText = SK_ColorWHITE;
    constexpr SkColor kDarkInactiveTabText = Gray(0xD6);
    constexpr SkColor kTextFieldBackgroundColor = SK_ColorWHITE;
    constexpr SkColor kDarkTextFieldBackgroundColor = kEdgeDarkTransientBackgroundGray;

    // Button Colors
    constexpr SkColor kDarkThemePrimaryButton = kDarkModeAccentBlue;
    constexpr SkColor kDarkThemePrimaryButtonDisabled =
        SkColorSetRGB(0x34, 0x54, 0x6D);
    constexpr SkColor kDarkThemeLinkPressedFrameUI = SkColorSetRGB(0x52, 0xA3, 0xE2);
    constexpr SkColor kDarkThemeLinkPrimaryFrameUI = SkColorSetRGB(0x63, 0xAD, 0xE5);
    // Transient UI versions for links since these UIs
    // usually have lighter colored backgrounds. Used as the default
    // in dark mode to ensure contrast ratios if the developer doesn't
    // set anything else.
    constexpr SkColor kDarkThemeLinkPressedTransientUI =
        SkColorSetRGB(0x75, 0xB6, 0xE8);
    constexpr SkColor kDarkThemeLinkPrimaryTransientUI =
      SkColorSetRGB(0x86, 0xBF, 0xEB);
    constexpr SkColor kDarkThemeButtonColor = Gray(0x5C);
    constexpr SkColor kDarkThemeTabAudioIconHover =
        SkColorSetRGB(0x52, 0xA4, 0xE2);
    constexpr SkColor kDarkThemeTabAudioPressed =
        SkColorSetRGB(0x4A, 0x9F, 0xE0);
    constexpr SkColor kDarkThemeFocusedBorder = Gray(0x90);
    constexpr SkColor kDarkThemeFocusedBorderInner = SkColorSetA(SK_ColorBLACK, 0x7F);
    constexpr SkColor kLinkPressedFrameUI = SkColorSetRGB(0x11, 0x81, 0xD7);
    constexpr SkColor kLinkPrimaryFrameUI = SkColorSetRGB(0x00, 0x72, 0xC9);
    // Transient UI versions for links since these UIs
    // usually have lighter colored backgrounds.
    constexpr SkColor kLinkHoveredTransientUI = SkColorSetRGB(0x00, 0x66, 0xB4);
    constexpr SkColor kDarkLinkHoveredTransientUI =
        SkColorSetRGB(0xA0, 0xCD, 0xEF);
    constexpr SkColor kPrimaryButton = kLightModeAccentBlue;
    constexpr SkColor kPrimaryButtonDisabled = SkColorSetRGB(0xB3, 0xD7, 0xF2);
    constexpr SkColor kButtonColor = kEdgeWhiteSmoke;
    constexpr SkColor kTabAudioIconHover = SkColorSetRGB(0x00, 0x61, 0xAB);
    constexpr SkColor kTabAudioIconPressed = SkColorSetRGB(0x00, 0x65, 0xB2);
    constexpr SkColor kFocusedBorder = Gray(0x83);
    constexpr SkColor kFocusedBorderInner = SkColorSetA(SK_ColorWHITE, 0xF2);

    // Toggle Button colors
    constexpr SkColor kEdgeToggleButtonThumbOff = Gray(0x2B);
    constexpr SkColor kEdgeToggleButtonThumbOn = SK_ColorWHITE;
    constexpr SkColor kEdgeToggleButtonTrackOffBackground = SK_ColorWHITE;
    constexpr SkColor kEdgeToggleButtonTrackOffBorder = Gray(0x92);
    constexpr SkColor kEdgeToggleButtonTrackOn = kLightModeAccentBlue;
    constexpr SkColor kDarkThemeEdgeToggleButtonThumbOff = SK_ColorWHITE;
    constexpr SkColor kDarkThemeEdgeToggleButtonThumbOn = SK_ColorWHITE;
    constexpr SkColor kDarkThemeEdgeToggleButtonTrackOffBackground = Gray(0x5C);
    constexpr SkColor kDarkThemeEdgeToggleButtonTrackOffBorder = Gray(0xAF);
    constexpr SkColor kDarkThemeEdgeToggleButtonTrackOn = kDarkModeAccentBlue;
    constexpr SkColor kEdgeToggleButtonThumbOffDisabled = kDisabledText;
    constexpr SkColor kEdgeDarkThemeToggleButtonThumbOffDisabled =
        kDarkThemeDisabledText;

    // HubApps Tower colorful icon colors.
    constexpr SkColor kEdgeHubAppsTowerSilentNotificationLight =
        SkColorSetRGB(0xE0, 0x04, 0x04);
    constexpr SkColor kEdgeHubAppsTowerSilentNotificationDark =
        SkColorSetRGB(0xFA, 0xA6, 0x9E);
    constexpr SkColor kColorEdgeHubAppsTowerBadgeNumberLight =
        SkColorSetRGB(0xE0, 0x04, 0x04);
    constexpr SkColor kColorEdgeHubAppsTowerBadgeNumberDark =
        SkColorSetRGB(0xFA, 0xA6, 0x9E);
    constexpr SkColor kColorEdgeHubAppsTowerBadgeTextLight = SK_ColorWHITE;
    constexpr SkColor kColorEdgeHubAppsTowerBadgeTextDark =
        SkColorSetRGB(0x3B, 0x3B, 0x3B);

    constexpr SkColor kColorEdgeHubAppsTowerButtonHoveredCustomLight =
        SkColorSetA(SK_ColorBLACK, 0x0A);  // 4%;
    constexpr SkColor kColorEdgeHubAppsTowerButtonHoveredCustomDark =
        SkColorSetA(SK_ColorWHITE, 0x0A);  // 4%;
    constexpr SkColor kColorEdgeHubAppsTowerButtonActiveCustomLight =
        SkColorSetA(SK_ColorWHITE, 0xDA);  // 85%
    constexpr SkColor kColorEdgeHubAppsTowerButtonActiveCustomDark =
        SkColorSetA(SK_ColorWHITE, 0x23);  // 14%

    // HubApps Background indicator colors.
    constexpr SkColor kColorEdgeHubAppsBackgroundActiveIndicatorLight =
        SkColorSetRGB(0x04, 0x81, 0xE0);
    constexpr SkColor kColorEdgeHubAppsBackgroundActiveIndicatorDark =
        SkColorSetRGB(0x04, 0x81, 0xE0);
    constexpr SkColor kColorEdgeHubAppsBackgroundInactiveIndicatorLight =
        SkColorSetRGB(0xA8, 0xA8, 0xA8);
    constexpr SkColor kColorEdgeHubAppsBackgroundInactiveIndicatorDark =
        SkColorSetRGB(0xA8, 0xA8, 0xA8);

    // Background custom colors
    constexpr SkColor kDarkThemeBubbleBackgroundCustomGray = Gray(0x3B);
    constexpr SkColor kDarkThemeTextfieldCustomGray = Gray(0x24);
    constexpr SkColor kDarkThemeWarningRed =
        SkColorSetARGB(0xFF, 0xF2, 0x8B, 0x82);
    constexpr SkColor kDarkThemeDisabledTextCustomColor = Gray(0x80);
    constexpr SkColor kDarkThemeBorderColor = Gray(0x84);
    constexpr SkColor kBackgroundTintBlueLight =
        SkColorSetARGB(0xFF, 0xE8, 0xF5, 0xFF);
    constexpr SkColor kBackgroundTintBlueDark =
        SkColorSetARGB(0xFF, 0x00, 0x3B, 0x68);
    constexpr SkColor kBackgroundTintBlueAccentDark =
        SkColorSetARGB(0xFF, 0x4C, 0x59, 0x63);

    // Bubble border
    constexpr SkColor kBubbleBorderWhenShadowPresent =
        SkColorSetA(SK_ColorBLACK, 0x0E);
    constexpr SkColor kDarkThemeBubbleBorderWhenShadowPresent =
        SkColorSetA(SK_ColorBLACK, 0x33);

    // Rewards points
    constexpr SkColor kRewardPointsDarkBlue = SkColorSetRGB(0x46, 0xA6, 0xFF);
    constexpr SkColor kRewardPointsLightBlue = SkColorSetRGB(0x03, 0x6A, 0xC4);
    constexpr SkColor kEdgeWalletEntryShadow =
        SkColorSetARGB(0x1A, 0x00, 0x00, 0x00);
    constexpr SkColor kRewardMessageDark = SkColorSetRGB(0xFF, 0xFF, 0xFF);
    constexpr SkColor kRewardMessageLight = SkColorSetRGB(0x71, 0x71, 0x71);
    constexpr SkColor kWalletSeparatorDark = SkColorSetRGB(0x52, 0x52, 0x52);
    constexpr SkColor kWalletSeparatorLight = SkColorSetRGB(0xEF, 0xEF, 0xEF);

    // Edge copilot mode
    constexpr SkColor kEdgeCopilotModeDescDark =
        SkColorSetRGB(0xFF, 0xFF, 0xFF);
    constexpr SkColor kEdgeCopilotModeDescLight =
        SkColorSetRGB(0x71, 0x71, 0x71);

    // Account Transfer
    constexpr SkColor kEdgeAccountTransferIcon =
        SkColorSetRGB(0x23, 0x5C, 0xCF);
    constexpr SkColor kEdgeAccountTransferIconBackground =
        SkColorSetRGB(0xE0, 0xED, 0xFF);
    constexpr SkColor kEdgeAccountTransferIconBackgroundDark =
        SkColorSetARGB(0xFF, 0x4C, 0x59, 0x63);

    // Kiosk Items
    constexpr SkColor kKioskEndSessionButtonBackgroundDefault = Gray(0x73);
    constexpr SkColor kKioskEndSessionButtonBackgroundHover = SkColorSetRGB(0xE8, 0x11, 0x23);
    constexpr SkColor kKioskEndSessionButtonSymbolColorWhite = SK_ColorWHITE;
    constexpr SkColor kKioskEndSessionButtonTransparent = SK_ColorTRANSPARENT;

    // List Items
    constexpr SkColor kHoverItemBlue = SkColorSetARGB(0xFF, 0xDD, 0xEB, 0xF7);

    // Menu Items
    constexpr SkColor kMenuItemBackgroundFocused = Gray(0xEE);
    constexpr SkColor kHighlightedMenuItemBackground =
        SkColorSetRGB(0xE3, 0xF0, 0xFA);
    constexpr SkColor kDarkThemeHighlightedMenuItemBackground =
        SkColorSetRGB(0x4C, 0x59, 0x63);
    constexpr SkColor kDarkThemeListRowSelectedHighLight = Gray(0x5C);
    constexpr SkColor kListRowSelectedHighLight = Gray(0xED);
    constexpr SkColor kMenuItemSemitransparentBackgroundFocused =
        SkColorSetA(SK_ColorBLACK, 0x0A);
    constexpr SkColor kDarkThemeMenuItemSemitransparentBackgroundFocused =
        SkColorSetA(SK_ColorWHITE, 0x0F);
    constexpr SkColor kHighlightedMenuItemBackgroundFocused =
        SkColorSetRGB(0xD3, 0xDF, 0xE9);
    constexpr SkColor kDarkThemeHighlightedMenuItemBackgroundFocused =
        SkColorSetA(SK_ColorWHITE, 0x20);
    constexpr SkColor kMenuSemitransparentForeground =
        SkColorSetA(SK_ColorBLACK, 0xE4);
    constexpr SkColor kMenuSemitransparentForegroundDisabled =
        SkColorSetA(SK_ColorBLACK, 0x5C);
    constexpr SkColor kDarkThemeMenuSemitransparentForegroundDisabled =
        SkColorSetA(SK_ColorWHITE, 0x5D);
    constexpr SkColor kMenuSemitransparentSecondaryForeground =
        SkColorSetA(SK_ColorBLACK, 0x9B);
    constexpr SkColor kDarkThemeMenuSemitransparentSecondaryForeground =
        SkColorSetA(SK_ColorWHITE, 0xC8);
    constexpr SkColor kMenuSemitransparentSeparator =
        SkColorSetA(SK_ColorBLACK, 0x0F);
    constexpr SkColor kDarkThemeMenuSemitransparentSeparator =
        SkColorSetA(SK_ColorWHITE, 0x14);
    constexpr SkColor kMenuItemBadgeBackgroundLight =
        SkColorSetRGB(0xE0, 0xED, 0xFF);
    constexpr SkColor kMenuItemBadgeTextLight = SkColorSetRGB(0x23, 0x5C, 0xCF);
    constexpr SkColor kMenuItemBadgeBorderLight =
        SkColorSetRGB(0xA7, 0xC9, 0xFC);
    constexpr SkColor kMenuItemBadgeBackgroundDark =
        SkColorSetRGB(0x24, 0x39, 0x66);
    constexpr SkColor kMenuItemBadgeTextDark = SkColorSetRGB(0x86, 0xB3, 0xFC);
    constexpr SkColor kMenuItemBadgeBorderDark =
        SkColorSetRGB(0x26, 0x45, 0x87);

    // Edge Mac frosted glass tab layer background.
    constexpr SkColor kEdgeMacFrostedGlassTabLayerBackground =
        SkColorSetARGB(0xCC, 0xF6, 0xF6, 0xF6);
    constexpr SkColor kEdgeMacFrostedGlassTabLayerBackgroundDark =
        SkColorSetARGB(0x1A, 0xFF, 0xFF, 0xFF);

    // Tab Band
    constexpr SkColor kTabBarBackground = Gray(0xCE);
    constexpr SkColor kInactiveTabBarBackground = Gray(0xE8);
    constexpr SkColor kTabBarBackgroundMicaTintColor = Gray(0xCD);
    constexpr float kTabBarBackgroundMicaTintOpacity = 0.65f;
    constexpr SkColor kInactiveTabBarBackgroundMicaTintColor =
        kInactiveTabBarBackground;
    constexpr SkColor kTabSelected = kEdgeToolbarGray;
    constexpr SkColor kTabSeparator = Gray(0xB9);
    constexpr SkColor kTabSeparatorSemitransparent =
        SkColorSetA(SK_ColorWHITE, 0x0F);  // 6%
    constexpr SkColor kTabOutlineActive =
        SkColorSetA(SK_ColorBLACK, 0x1E);  // 12%

    // Tab Dark/InPrivate colors
    constexpr SkColor kInPrivateTabBarBackground = Gray(0x1B);
    constexpr SkColor kInactiveInPrivateTabBarBackground = Gray(0x2E);
    constexpr SkColor kInPrivateTabBarBackgroundMicaTintColor =
        kDarkMicaTintColor;
    constexpr float kInPrivateTabBarBackgroundMicaTintOpacity =
        kDarkMicaTintOpacity;
    constexpr SkColor kInactiveInPrivateTabBarBackgroundMicaTintColor =
        kInactiveInPrivateTabBarBackground;
    constexpr SkColor kInPrivateTabBarBackgroundMultiSelect = Gray(0x2D);
    constexpr SkColor kInPrivateTabSeparator = Gray(0x3E);
    constexpr SkColor kInPrivateTabSeparatorSemitransparent =
        SkColorSetA(SK_ColorWHITE, 0x3D);  // 24%
    constexpr SkColor kInPrivateToolbar = Gray(0x3B);
    constexpr SkColor kInPrivateTabOutlineActive =
        SkColorSetA(SK_ColorWHITE, 0x0F);  // 6%

    // Vertical Tab Strip colors
    constexpr SkColor kVerticalTabStripActiveTabLightBackground = SK_ColorWHITE;
    constexpr SkColor kVerticalTabStripActiveTabLightBackgroundSemitransparent =
        SkColorSetA(SK_ColorWHITE, 0xCD); // 80%
    constexpr SkColor kVerticalTabStripActiveTabLightBackgroundPhoenix =
        SkColorSetA(SK_ColorWHITE, 0xFF);  // 100%
    constexpr SkColor kVerticalTabStripActiveTabDarkBackground = Gray(0x4D);
    constexpr SkColor kVerticalTabStripActiveTabDarkBackgroundSemitransparent =
        SkColorSetA(SK_ColorWHITE, 0x26);  // 15%
    constexpr SkColor kVerticalTabStripActiveTabDarkBackgroundPhoenix =
        SkColorSetA(SK_ColorWHITE, 0x23);  // 14%
    constexpr SkColor kVerticalTabStripHoverTabLightBackground = Gray(0xEA);
    constexpr SkColor kVerticalTabStripHoverTabLightBackgroundSemitransparent =
        SkColorSetA(SK_ColorBLACK, 0x0D); // 5%
    constexpr SkColor kVerticalTabStripHoverTabLightBackgroundPhoenix =
        SkColorSetA(SK_ColorBLACK, 0x0F);  // 6%
    constexpr SkColor kVerticalTabStripHoverTabDarkBackground = Gray(0x4F);
    constexpr SkColor kVerticalTabStripHoverTabDarkBackgroundSemitransparent =
        SkColorSetA(SK_ColorWHITE, 0x17);  // 9%
    constexpr SkColor kVerticalTabStripHoverTabDarkBackgroundPhoenix =
        SkColorSetA(SK_ColorWHITE, 0x0F);  // 6%
    constexpr SkColor kVerticalTabStripMultiSelectTabLightBackground =
        Gray(0xE5);
    constexpr SkColor kVerticalTabStripMultiSelectTabDarkBackground =
        Gray(0x54);
    constexpr SkColor
        kVerticalTabStripMultiSelectTabDarkBackgroundSemitransparent =
            SkColorSetA(SK_ColorWHITE, 0x0F);  // 6%
    constexpr SkColor
        kVerticalTabStripMultiSelectTabLightBackgroundSemitransparent =
            SkColorSetA(SK_ColorWHITE, 0x80); // 50%
    constexpr SkColor kVerticalTabStripMultiSelectTabDarkBackgroundPhoenix =
        SkColorSetA(SK_ColorWHITE, 0x0F);  // 6%
    constexpr SkColor kVerticalTabStripMultiSelectTabLightBackgroundPhoenix =
        SkColorSetA(SK_ColorWHITE, 0x72);  // 45%
    constexpr SkColor kVerticalTabStripLightForeground = Gray(0x26);
    constexpr SkColor kVerticalTabStripDarkForeground = SK_ColorWHITE;
    constexpr SkColor kVerticalTabStripNewTabButtonLightInkDrop = Gray(0xB0);
    constexpr SkColor kVerticalTabStripNewTabButtonDarkInkDrop = Gray(0xBA);
    constexpr SkColor
        kVerticalTabStripTabCloseButtonInkDropLightBackgroundSemitransparent =
            SkColorSetA(SK_ColorBLACK, 0x99);  // 60%
    constexpr SkColor
        kVerticalTabStripTabCloseButtonInkDropDarkBackgroundSemitransparent =
            SkColorSetA(SK_ColorWHITE, 0x99);  // 60%

    // RBI Tab colors
    constexpr SkColor kTabStripActiveRbiTabBackground =
        SkColorSetRGB(0xD6, 0x68, 0x00);
    constexpr SkColor kTabStripInactiveRbiTabBackground =
        SkColorSetRGB(0xDC, 0xB5, 0x91);

    // UI Etcetera
    constexpr SkColor kDarkThemeDividerLine = Gray(0x63);
    constexpr SkColor kDividerLine = Gray(0xDA);

    // Omnibox text colors.
    constexpr SkColor kOmniboxHintText = Gray(0x76);
    constexpr SkColor kInPrivateOmniboxHintText = Gray(0x92);
    constexpr SkColor kOmniboxUrlText = SkColorSetRGB(0x1A, 0x63, 0x97);
    constexpr SkColor kInPrivateOmniboxUrlText =
        SkColorSetRGB(0x75, 0xB6, 0xE8);
    constexpr SkColor kOmniboxCouponText = SkColorSetRGB(0x03, 0x6A, 0xC4);
    constexpr SkColor kOmniboxCashbackHighlight = SK_ColorWHITE;
    constexpr SkColor kOmniboxAdSlug = SkColorSetRGB(0x61, 0x61, 0x61);
    constexpr SkColor kOmniboxAdSlugDark = SkColorSetRGB(0xD1, 0xD1, 0xD1);

    // Omnibox background colors.
    constexpr SkColor kOmniboxBackgroundColor = SK_ColorWHITE;
    constexpr SkColor kInPrivateOmniboxBackgroundColor = Gray(0x2B);
    constexpr SkColor kInPrivateOmniboxFocusedBackgroundColor =
        kInPrivateOmniboxBackgroundColor;
    constexpr SkColor kLocationBarBackgroundColorWhiteVariant = SK_ColorWHITE;
    constexpr SkColor kLocationBarBackgroundColorDark =
        SkColorSetRGB(0x29, 0x29, 0x29);
    constexpr SkColor kLocationBarHoverBackgroundColorDarkerVariant =
        SkColorSetRGB(0xF5, 0xF5, 0xF5);
    constexpr SkColor kLocationBarHoverBackgroundColorDarkerVariantDark =
        SkColorSetRGB(0x3D, 0x3D, 0x3D);

    // Omnibox border and shadow colors.
    constexpr SkColor kOmniboxBlue = SkColorSetRGB(0x00, 0x55, 0xD7);
    constexpr SkColor kInPrivateOmniboxBlue = SkColorSetRGB(0x63, 0xAD, 0xE5);
    constexpr SkColor kOmniboxFocusRing = SkColorSetA(kOmniboxBlue, 0x66);
    constexpr SkColor kOmniboxBoldFocusRing = SkColorSetRGB(0x21, 0x69, 0xEB);
    constexpr SkColor kOmniboxBoldFocusRingDark =
        SkColorSetRGB(0x4D, 0x8D, 0xFA);
    constexpr SkColor kLocationBarBorder =
        SkColorSetA(SK_ColorBLACK, 0x2E);  // 18%
    constexpr SkColor kLocationBarBorderDark =
        SkColorSetA(SK_ColorWHITE, 0x4A);  // 29%
    constexpr SkColor kLocationBarHoverBorder =
        SkColorSetA(SK_ColorBLACK, 0x38);  // 22%
    constexpr SkColor kLocationBarHoverBorderDark =
        SkColorSetA(SK_ColorWHITE, 0x75);  // 46%
    constexpr SkColor kOmniboxShadow = SkColorSetA(SK_ColorBLACK, 0x14);
    constexpr SkColor kInPrivateOmniboxShadow = SK_ColorTRANSPARENT;

    // Omnibox switch-to-tab button colors.
    constexpr SkColor kOmniboxSwitchToTabButtonRestBorder =
        Gray(0x85);  // 48% alpha black
    constexpr SkColor kOmniboxSwitchToTabButtonHoverBorder =
        Gray(0xA3);  // 36% alpha black
    constexpr SkColor kOmniboxSwitchToTabButtonPressedBorder =
        Gray(0x66);  // 60% alpha black
    constexpr SkColor kInPrivateOmniboxSwitchToTabButtonRestBorder =
        Gray(0x7A);  // 48% alpha white
    constexpr SkColor kInPrivateOmniboxSwitchToTabButtonHoverBorder =
        Gray(0x5C);  // 36% alpha white
    constexpr SkColor kInPrivateOmniboxSwitchToTabButtonPressedBorder =
        Gray(0x99);  // 60% alpha white
    constexpr SkColor kOmniboxSwitchToTabButtonRestBackground = SK_ColorWHITE;
    constexpr SkColor kOmniboxSwitchToTabButtonHoverBackground =
        Gray(0xEB);  // 8% alpha black
    constexpr SkColor kOmniboxSwitchToTabButtonPressedBackground =
        Gray(0xD6);  // 16% alpha black
    constexpr SkColor kInPrivateOmniboxSwitchToTabButtonRestBackground =
        kInPrivateOmniboxFocusedBackgroundColor;
    constexpr SkColor kInPrivateOmniboxSwitchToTabButtonHoverBackground =
        Gray(0x14);  // 8% alpha white
    constexpr SkColor kInPrivateOmniboxSwitchToTabButtonPressedBackground =
        Gray(0x29);  // 16% alpha white

    // Omnibox suggestion icon experimental colors
    // Please do not use them until approved
    constexpr SkColor kInPrivateOmniboxGhostTextIncreasedContrast =
        SkColorSetARGB(0xCC, 0xFF, 0xFF, 0xFF);
    constexpr SkColor kOmniboxGhostTextIncreasedContrast =
        SkColorSetARGB(0xBF, 0x00, 0x00, 0x00);
    constexpr SkColor kInPrivateOmniboxResultsIconHovered = Gray(0xB4);
    constexpr SkColor kOmniboxResultsIconHovered = Gray(0x66);
    constexpr SkColor kInPrivateOmniboxResultsTextDimmedHovered = Gray(0xB4);
    constexpr SkColor kOmniboxResultsTextDimmedHovered = Gray(0x66);
    constexpr SkColor kInPrivateOmniboxResultsTextDimmedSelected = Gray(0xA2);
    constexpr SkColor kOmniboxResultsTextDimmedSelected = Gray(0x6E);
    constexpr SkColor kOmniboxLocalHistoryHeader =
        SkColorSetRGB(0x60, 0x00, 0x90);
    constexpr SkColor kOmniboxWorkRelatedHeader =
        SkColorSetRGB(0x60, 0x00, 0x90);
    constexpr SkColor kOmniboxLocalHistoryHeaderDark =
        SkColorSetRGB(0x9E, 0xA2, 0xFF);
    constexpr SkColor kOmniboxWorkRelatedHeaderDark =
        SkColorSetRGB(0x9E, 0xA2, 0xFF);
    constexpr SkColor kOmniboxColoredHeaderBackground =
        SkColorSetARGB(0x59, 0xE9, 0xE9, 0xE9);
    constexpr SkColor kOmniboxColoredHeaderBackgroundDark =
        SkColorSetARGB(0x33, 0x00, 0x00, 0x00);
    constexpr SkColor kOmniboxBoldSpyglassIconDark =
        SkColorSetRGB(0x3C, 0x99, 0xE9);

    // Omnibox Status Pill Visual Refresh Colors
    constexpr SkColor kOmniboxPillVisualRefreshDefaultBackground =
        SkColorSetARGB(0x0B, 0x00, 0x00, 0x00);
    constexpr SkColor kOmniboxPillVisualRefreshDefaultBackgroundDark =
        SkColorSetARGB(0x0B, 0xFF, 0xFF, 0xFF);
    constexpr SkColor kOmniboxPillVisualRefreshDangerousBackground =
        SkColorSetRGB(0xC5, 0x0F, 0x1F);
    constexpr SkColor kOmniboxPillVisualRefreshDangerousForegroundTextLight =
        SkColorSetRGB(0xC5, 0x0F, 0x1F);
    constexpr SkColor kOmniboxPillVisualRefreshDangerousForegroundTextDark =
        SkColorSetRGB(0xDC, 0x62, 0x6D);

    // Attention State
    constexpr SkColor kAttention_Base = SkColorSetRGB(0xFF, 0x8C, 0x00);
    constexpr SkColor kAttention_Phase = SkColorSetRGB(0xCC, 0x70, 0x00);

    // Loading indicator
    constexpr SkColor kThrobberSpinning = SkColorSetRGB(0x00, 0x5D, 0xA4);
    constexpr SkColor kInPrivateThrobberSpinning =
        SkColorSetRGB(0x5A, 0xAB, 0xE3);
    constexpr SkColor kThrobberWaiting = Gray(0x5F);
    constexpr SkColor kInPrivateThrobberWaiting = Gray(0xA0);

    // TabbedPane
    constexpr SkColor kTabTitleColorActive = kBaseBlue;
    constexpr SkColor kTabTitleColorInactive = kEdgeMidDarkGray;
    constexpr SkColor kTabBottomBorder = kEdgeMidDarkGray;
    constexpr SkColor kTabBottomSelectedBorder = kBaseBlue;

    // Tab recording alert
    constexpr SkColor kTabAlertRecording = SkColorSetRGB(0xD9, 0x30, 0x25);

    // Tab sleeping alert
    constexpr SkColor kTabAlertSleeping = SkColorSetRGB(0x7F, 0xBA, 0x00);

    // Find Bar
    constexpr SkColor kLightModeFindBarBackground = SK_ColorWHITE;
    constexpr SkColor kDarkModeFindBarBackground = kEdgeDarkBackgroundGray;

    // Smart Find Bar
    constexpr SkColor kSmartFindControlsBackgroundLight = Gray(0xF3);
    constexpr SkColor kSmartFindControlsBackgroundDark = Gray(0x47);
    constexpr SkColor kSmartFindRelatedMatchesTextLight = Gray(0x6D);
    constexpr SkColor kSmartFindRelatedMatchesTextDark = Gray(0xBF);
    constexpr SkColor kSmartFindToggleTitleTextLight = Gray(0x29);
    constexpr SkColor kSmartFindToggleTitleTextDark =
        SkColorSetARGB(0xFF, 0xFF, 0xFF, 0xFF); // Force full opacity white.
    constexpr SkColor kSmartFindSuggestedMatchesTitleLight = Gray(0x29);
    constexpr SkColor kSmartFindSuggestedMatchesTitleDark =
        SkColorSetARGB(0xFF, 0xFF, 0xFF, 0xFF);  // Force full opacity white.
    constexpr SkColor kSmartFindPillButtonNonCheckedTextLight =
        SkColorSetRGB(0x00, 0x00, 0x00);
    constexpr SkColor kSmartFindPillButtonNonCheckedTextDark =
        SkColorSetRGB(0xFF, 0xFF, 0xFF);
    constexpr SkColor kSmartFindPillButtonNonCheckedBorderStrokeLight =
        SkColorSetRGB(0xD6, 0xD6, 0xD6);
    constexpr SkColor kSmartFindPillButtonNonCheckedBorderStrokeDark =
        SkColorSetRGB(0xB1, 0xB1, 0xB1);
    constexpr SkColor kSmartFindPillButtonNonCheckedBackground =
        SkColorSetARGB(0x00, 0x00, 0x00, 0x00);
    constexpr SkColor kSmartFindPillButtonCheckedTextLight =
        SkColorSetRGB(0xFF, 0xFF, 0xFF);
    constexpr SkColor kSmartFindPillButtonCheckedTextDark =
        SkColorSetRGB(0x00, 0x00, 0x00);
    constexpr SkColor kSmartFindPillButtonCheckedBackgroundLight =
        SkColorSetRGB(0x00, 0x78, 0xD4);
    constexpr SkColor kSmartFindPillButtonCheckedBackgroundDark =
        SkColorSetRGB(0X82, 0xDD, 0xFD);
    constexpr SkColor kSmartFindOptionsButtonForegroundToggledLight =
        SkColorSetRGB(0x00, 0x00, 0x00);
    constexpr SkColor kSmartFindOptionsButtonForegroundToggledDark =
        SkColorSetRGB(0xFF, 0xFF, 0xFF);
    constexpr SkColor kSmartFindOptionsButtonBackgroundToggledLight =
        SkColorSetRGB(0xED, 0xED, 0xED);
    constexpr SkColor kSmartFindOptionsButtonBackgroundToggledDark =
        SkColorSetRGB(0x5C, 0x5C, 0x5C);

    // Accents
    constexpr SkColor kDarkModeActionIconAccentColor =
        kDarkThemeLinkPrimaryTransientUI;

    // NTP
    constexpr SkColor kNTPLink = kLinkPrimaryFrameUI;
    constexpr SkColor kInPrivateNTPLink = kDarkThemeLinkPrimaryFrameUI;

    // Chrome Webstore Infobar
    constexpr SkColor kChromeWebstoreInfoBarLabelColor =
        SkColorSetARGB(0xFF, 0x2A, 0x10, 0x06);
    constexpr SkColor kChromeWebstoreInfoBarDarkLabelColor = SK_ColorWHITE;

    constexpr SkColor kChromeWebstoreInfoBarBackgroundColor =
        SkColorSetARGB(0xFF, 0xF9, 0xDF, 0xD5);
    constexpr SkColor kChromeWebstoreInfoBarDarkBackgroundColor =
        SkColorSetARGB(0xFF, 0x83, 0x24, 0x01);

    constexpr SkColor kChromeWebstoreInfoBarLinkColor =
        SkColorSetARGB(0xFF, 0x00, 0x66, 0xB4);
    constexpr SkColor kChromeWebstoreInfoBarDarkLinkColor =
        SkColorSetARGB(0xFF, 0x7D, 0xBA, 0xE9);

    constexpr SkColor kChromeWebstoreLongInfoBarBackgroundColor =
        SkColorSetRGB(0xF3, 0xF3, 0xF3);
    constexpr SkColor kChromeWebstoreLongInfoBarTextColorDark =
        SkColorSetRGB(0xFF, 0xFF, 0xFF);
    constexpr SkColor kChromeWebstoreLongInfoBarTextColor =
        SkColorSetRGB(0x1A, 0x1A, 0x1A);

    // Toolbar
    constexpr SkColor kToolbarSeparator = Gray(0xD2);
    constexpr SkColor kInPrivateToolbarSeparator = Gray(0x5B);
    constexpr SkColor kToolbarSeparatorSemitransparent =
        SkColorSetA(SK_ColorBLACK, 0x0F);  // 6%
    constexpr SkColor kInPrivateToolbarSeparatorSemitransparent =
        SkColorSetA(SK_ColorWHITE, 0x3D);  // 24%
    constexpr SkColor kPhoenixLightToolbarDisabled = Gray(0xAC);

    // PDF Highlight Colors
    // Note: Update the color at AddRoleDescriptionForHighlight() in
    // components\pdf\renderer\pdf_accessibility_tree.cc file whenever a
    // highlight color is added or updated here.
    constexpr SkColor kHighlighterYellow =
        SkColorSetARGB(0xFF, 0xFF, 0xF0, 0x66);
    constexpr SkColor kHighlighterGreen =
        SkColorSetARGB(0xFF, 0x7D, 0xF0, 0x66);
    constexpr SkColor kHighlighterLightBlue =
        SkColorSetARGB(0xFF, 0x8F, 0xDE, 0xF9);
    constexpr SkColor kHighlighterPink = SkColorSetARGB(0xFF, 0xF7, 0x99, 0xD1);
    constexpr SkColor kHighlighterRed = SkColorSetARGB(0xFF, 0xEB, 0x49, 0x49);

    // PDF Highlight Colors for new stack.
    // Note: Update the color at AddRoleDescriptionForHighlight() in
    // components\pdf\edge_renderer\edge_pdf_accessibility_util.cc file whenever
    // a highlight color is added or updated here.
    constexpr SkColor kHighlighterAccAsyncYellow =
        SkColorSetARGB(0xFF, 0xFF, 0xF0, 0x66);
    constexpr SkColor kHighlighterAccAsyncGreen =
        SkColorSetARGB(0xFF, 0x7C, 0xF0, 0x66);
    constexpr SkColor kHighlighterAccAsyncLightBlue =
        SkColorSetARGB(0xFF, 0x8E, 0xDD, 0xF9);
    constexpr SkColor kHighlighterAccAsyncPink =
        SkColorSetARGB(0xFF, 0xF6, 0x99, 0xD1);
    constexpr SkColor kHighlighterAccAsyncRed =
        SkColorSetARGB(0xFF, 0xEB, 0x49, 0x49);

    // Mac Increase Contrast Colors
    constexpr SkColor kMacIncreasedContrastBorderColorLight = Gray(0x3C);
    constexpr SkColor kMacIncreasedContrastBorderColorDark = Gray(0xC3);
    constexpr SkColor kMacIncreasedContrastActiveTabBorderLight =
        Gray(0x88);
    constexpr SkColor kMacIncreasedContrastActiveTabBorderDark =
        Gray(0x9D);
    constexpr SkColor kMacIncreasedContrastVerticalSeparatorLight =
        Gray(0x3C);
    constexpr SkColor kMacIncreasedContrastVerticalSeparatorDark =
        Gray(0x9C);
    constexpr SkColor kMacIncreasedContrastAccentButtonColorLight =
        SkColorSetARGB(0xFF, 0x00, 0x56, 0x99);
    constexpr SkColor kMacIncreasedContrastAccentButtonColorDark =
        SkColorSetARGB(0xFF, 0x63, 0xAD, 0xE5);
    constexpr SkColor kMacIncreasedContrastButtonOutlineLight  =
        Gray(0x75);
    constexpr SkColor kMacIncreasedContrastButtonOutlineDark =
        Gray(0xBA);

    // Mac Increase Contrast Omnibox colors
    // These are based on the MacOS system colors but we cannot rely on
    // getting the right ones because in InPrivate, our omnibox color
    // state might not match the platform.
    constexpr SkColor kMacIncreasedContrastOmniboxTextDimmedLight =
        Gray(0x3E);
    constexpr SkColor kMacIncreasedContrastOmniboxTextDimmedDark =
        Gray(0x95);

    // WDAG Colors
    constexpr SkColor kWdagFlyoutIcon = SK_ColorBLACK;

    // Profile avatar icon colors.
    constexpr SkColor kAvatarIconBackground = SK_ColorWHITE;
    constexpr SkColor kAvatarIconDarkBackground = Gray(0xD5);

    // Profile popup
    constexpr SkColor kColorEdgeProfileFlyoutTitleTextLight =
        SkColorSetRGB(0x71, 0x71, 0x71);
    constexpr SkColor kColorEdgeProfileFlyoutTitleTextDark = SK_ColorWHITE;
    constexpr SkColor kColorEdgeProfileFlyoutIconTextLight =
        SkColorSetRGB(0x71, 0x71, 0x71);
    constexpr SkColor kColorEdgeProfileFlyoutIconTextDark = SK_ColorWHITE;
    constexpr SkColor kEdgeProfileFlyoutBottomMessageLight =
        SkColorSetRGB(0x71, 0x71, 0x71);
    constexpr SkColor kEdgeProfileFlyoutBottomMessageDark = SK_ColorWHITE;
    constexpr SkColor kEdgeProfileBackgroundLight =
        SkColorSetARGB(0xFF, 0xF3, 0xF3, 0xF3);
    constexpr SkColor kEdgeProfileBackgroundDark =
        SkColorSetARGB(0xFF, 0x20, 0x20, 0x20);
    constexpr SkColor kEdgeProfileSectionBackgroundLight = SK_ColorWHITE;
    constexpr SkColor kEdgeProfileSectionBackgroundDark =
        SkColorSetARGB(0xFF, 0x30, 0x30, 0x30);
    constexpr SkColor kEdgeProfileEmailForegroundLight = Gray(0x71);
    constexpr SkColor kEdgeProfileEmailForegroundDark = Gray(0xE0);
    constexpr SkColor kEdgeProfileSigninCampaignBackgroundLight =
        SkColorSetARGB(0xFF, 0xEF, 0XF6, 0xFC);
    constexpr SkColor kEdgeProfileSigninCampaignBackgroundDark =
        SkColorSetARGB(0xFF, 0x4B, 0X4B, 0x4B);

    // Edge Alert severity colors
    constexpr SkColor kColorAlertHighSeverityDarkMode =
        SkColorSetRGB(0xF2, 0x8B, 0x82);
    constexpr SkColor kColorAlertLowSeverityDarkMode =
        SkColorSetRGB(0x81, 0xC9, 0x95);
    constexpr SkColor kColorAlertMediumSeverityDarkMode =
        SkColorSetRGB(0xFD, 0xD6, 0x63);
    constexpr SkColor kColorAlertHighSeverityLightMode =
        SkColorSetRGB(0xD9, 0x30, 0x25);
    constexpr SkColor kColorAlertLowSeverityLightMode =
        SkColorSetRGB(0x18, 0x80, 0x38);
    constexpr SkColor kColorAlertMediumSeverityLightMode =
        SkColorSetRGB(0xF2, 0x99, 0x00);

    // Sync icon colors.
    constexpr SkColor kIdentityInSyncIconGreen =
        SkColorSetRGB(0x10, 0x7C, 0x10);
    constexpr SkColor kDarkModeIdentityInSyncIconGreen =
        SkColorSetRGB(0x7F, 0xDA, 0x91);
    constexpr SkColor kIdentityNotSyncingIconColor = Gray(0x2B);
    constexpr SkColor kDarkModeIdentityNotSyncingIconColor = SK_ColorWHITE;
    constexpr SkColor kDarkThemeErrorRed = SkColorSetRGB(0xE8, 0x8D, 0x6C);
    constexpr SkColor kErrorRed = SkColorSetRGB(0xA8, 0x00, 0x00);
    constexpr SkColor kDarkThemeErrorBlue = SkColorSetRGB(0x82, 0xBD, 0xEA);
    constexpr SkColor kErrorBlue = SkColorSetRGB(0x00, 0x69, 0xB9);

    // Phoenix Error Colors
    constexpr SkColor kPhoenixColorPaletteGreenForeground1 =
        SkColorSetRGB(0x10, 0x7C, 0x10);
    constexpr SkColor kPhoenixColorPaletteGreenForeground3 =
        SkColorSetRGB(0x9F, 0xD8, 0x9F);
    constexpr SkColor kPhoenixColorPaletteMuted =
        SkColorSetARGB(0xFF, 0xAB, 0xAB, 0xAA);

    // Scrollbar Colors
    constexpr SkColor kScrollTrackColor = Gray(0xF2);
    constexpr SkColor kScrollThumbColor = Gray(0xCE);
    constexpr SkColor kScrollHoverColor = Gray(0xBF);
    constexpr SkColor kScrollPressedColor = Gray(0xD9);
    constexpr SkColor kScrollArrowColor = Gray(0x10);
    constexpr SkColor kScrollArrowDisabledColor = Gray(0xD9);
    constexpr SkColor kDarkModeScrollTrackColor = Gray(0x2B);
    constexpr SkColor kDarkModeScrollThumbColor = Gray(0x4F);
    constexpr SkColor kDarkModeScrollHoverColor = Gray(0x5E);
    constexpr SkColor kDarkModeScrollPressedColor = Gray(0x42);
    constexpr SkColor kDarkModeScrollArrowColor = SK_ColorWHITE;
    constexpr SkColor kDarkModeScrollArrowDisabledColor = Gray(0x6B);

    // Minimal Scrollbar Colors and opacities.
    // See scroll_bar_views.h for more on the minimal scrollbar.
    constexpr SkColor kMinimalScrollThumbColor = SK_ColorBLACK;
    constexpr SkColor kDarkModeMinimalScrollThumbColor = SK_ColorWHITE;
    constexpr SkAlpha kMinimalScrollThumbAlpha = 0x6C;          // 42%
    constexpr SkAlpha kMinimalScrollHoverAlpha = 0x85;          // 52%
    constexpr SkAlpha kMinimalScrollDisabledAlpha = 0xF;        // 6%
    constexpr SkAlpha kDarkModeMinimalScrollThumbAlpha = 0x57;  // 34%
    constexpr SkAlpha kDarkModeMinimalScrollHoverAlpha = 0x72;  // 45%

    // Text selection colors
    constexpr SkColor kSelectedTextColor = SK_ColorWHITE;
    constexpr SkColor kDarkModeSelectedTextColor = SK_ColorBLACK;
    constexpr SkColor kDarkModeSelectedTextBackgroundColor =
        SkColorSetRGB(0x93, 0xB8, 0xE7);
    constexpr SkColor kSelectedTextBackgroundColor =
        SkColorSetRGB(0x00, 0x78, 0xD4);

    // Tooltip
    constexpr SkColor kTooltipBackground = Gray(0xFF);
    constexpr SkColor kTooltipText = Gray(0x2B);
    constexpr SkColor kDarkModeTooltipBackground = Gray(0x4A);
    constexpr SkColor kDarkModeTooltipText = Gray(0xFF);

    // Notification icon
    constexpr SkColor kLightModeNotificationIconColor =
        SkColorSetRGB(0x19, 0x67, 0xD2);
    constexpr SkColor kDarkModeNotificationIconColor =
        SkColorSetRGB(0x8A, 0xB4, 0xF8);

    // Share
    constexpr SkColor kDarkModeShareBackground = Gray(0x3B);
    constexpr SkColor kLightModeShareBackground = SK_ColorWHITE;

    // Wallet
    constexpr SkColor kDarkModeWalletZipDialogBackground = Gray(0x4A);
    constexpr SkColor kLightModeWalletZipDialogBackground =
        SkColorSetRGB(0xFF, 0xFF, 0xFA);

    // Vertical Tabs
    constexpr SkAlpha kNewTabHintTextThemeAlpha = 0x9c;

    // Sleeping tabs
    constexpr SkColor kLightModeInactiveTabTitleVisualContrast = Gray(0xE5);
    constexpr SkColor kLightModeFadedTabText =
        SkColorSetARGB(0x3C, 0x00, 0x00, 0x00);
    constexpr SkColor kDarkModeFadedTabText =
        SkColorSetARGB(0x30, 0xFF, 0xFF, 0xFF);
    constexpr SkColor kLightModeFadedVerticalTabText =
        SkColorSetARGB(0x55, 0x00, 0x00, 0x00);
    constexpr SkColor kDarkModeFadedVerticalTabText =
        SkColorSetARGB(0x5A, 0xFF, 0xFF, 0xFF);
    constexpr SkAlpha kFadedTabIconAlpha = 0x66;  // 40%

    // Safety Tips
    constexpr SkColor kSafetyTipWarningYellowBackground =
        SkColorSetRGB(0xFF, 0xD9, 0x76);
    constexpr SkColor kSafetyTipWarningYellowIcon =
        SkColorSetRGB(0xF3, 0x95, 0x27);
    constexpr SkColor kSafetyTipWarningOrangeIcon =
        SkColorSetRGB(0xF7, 0x63, 0x0C);

    // Tab groups
    // Edge tab group colors are gray, pink, violet, orange, blue, teal, royal
    // blue, purple, and yellow.
    constexpr SkColor kGrayTabGroupColor = SkColorSetRGB(0x70, 0x6D, 0x6B);
    constexpr SkColor kPinkTabGroupColor = SkColorSetRGB(0xE3, 0x00, 0x8C);
    constexpr SkColor kVioletTabGroupColor = SkColorSetRGB(0xC2, 0x39, 0xB3);
    constexpr SkColor kOrangeTabGroupColor = SkColorSetRGB(0xCA, 0x50, 0x10);
    constexpr SkColor kBlueTabGroupColor = SkColorSetRGB(0x29, 0x6E, 0xEB);
    constexpr SkColor kTealTabGroupColor = SkColorSetRGB(0x03, 0x83, 0x87);
    constexpr SkColor kRoyalBlueTabGroupColor = SkColorSetRGB(0x00, 0x4E, 0x8C);
    constexpr SkColor kPurpleTabGroupColor = SkColorSetRGB(0x82, 0x30, 0xFF);
    constexpr SkColor kYellowTabGroupColor = SkColorSetRGB(0x98, 0x6F, 0x0B);
    constexpr SkColor kGrayDarkModeTabGroupColor =
        SkColorSetRGB(0x84, 0x81, 0x7E);
    constexpr SkColor kPinkDarkModeTabGroupColor =
        SkColorSetRGB(0xEE, 0x5F, 0xB7);
    constexpr SkColor kVioletDarkModeTabGroupColor =
        SkColorSetRGB(0xCF, 0x87, 0xDA);
    constexpr SkColor kOrangeDarkModeTabGroupColor =
        SkColorSetRGB(0xDF, 0x8E, 0x64);
    constexpr SkColor kBlueDarkModeTabGroupColor =
        SkColorSetRGB(0x69, 0xA1, 0xFA);
    constexpr SkColor kTealDarkModeTabGroupColor =
        SkColorSetRGB(0x4C, 0xB4, 0xB7);
    constexpr SkColor kRoyalBlueDarkModeTabGroupColor =
        SkColorSetRGB(0x4A, 0x89, 0xBA);
    constexpr SkColor kPurpleDarkModeTabGroupColor =
        SkColorSetRGB(0xB6, 0x96, 0xFF);
    constexpr SkColor kYellowDarkModeTabGroupColor =
        SkColorSetRGB(0xC1, 0xA2, 0x56);

    // Edge Fluent Scrollbars colors and opacities.
    constexpr SkColor kScrollEdgeFluentTrackColor =
        SkColorSetARGB(0xFF /* 100% */, 0xFC, 0xFC, 0xFC);
    constexpr SkColor kScrollEdgeFluentArrowColor =
        SkColorSetARGB(0x72 /* 44.6% */, 0x00, 0x00, 0x00);
    constexpr SkColor kScrollEdgeFluentPressedArrowColor =
        SkColorSetARGB(0x9E /* 61.96% */, 0x00, 0x00, 0x00);
    constexpr SkColor kDarkModeScrollEdgeFluentTrackColor =
        SkColorSetARGB(0xFF /* 100% */, 0x2C, 0x2C, 0x2C);
    constexpr SkColor kDarkModeScrollEdgeFluentArrowColor =
        SkColorSetARGB(0x8B /* 54.4% */, 0xFF, 0xFF, 0xFF);
    constexpr SkColor kDarkModeScrollEdgeFluentPressedArrowColor =
        SkColorSetARGB(0xC8 /* 78.6% */, 0xFF, 0xFF, 0xFF);

    // Edge badge label
    constexpr SkColor colorBrandBackground2TintLight =
        SkColorSetARGB(0xFF /* 100% */, 0xE0, 0xED, 0xFF);
    constexpr SkColor colorBrandStroke2TintLight =
        SkColorSetARGB(0xFF /* 100% */, 0xA7, 0xC9, 0xFC);
    constexpr SkColor colorBrandForeground2TintLight =
        SkColorSetARGB(0xFF /* 100% */, 0x23, 0x5C, 0xCF);
    constexpr SkColor colorBrandBackground2TintDark =
        SkColorSetARGB(0xFF /* 100% */, 0x24, 0x39, 0x66);
    constexpr SkColor colorBrandStroke2TintDark =
        SkColorSetARGB(0xFF /* 100% */, 0x26, 0x45, 0x87);
    constexpr SkColor colorBrandForeground2TintDark =
        SkColorSetARGB(0xFF /* 100% */, 0x86, 0xB3, 0xFC);

    // Divider
    constexpr SkColor kColorNeutralStroke2Light =
        SkColorSetARGB(0x1F, 0x00, 0x00, 0x00);
    constexpr SkColor kColorNeutralStroke2Dark =
        SkColorSetARGB(0x51, 0xFF, 0xFF, 0xFF);

    // Popup Background
    constexpr SkColor kColorLayerBackgroundDialogLight =
        SkColorSetARGB(0xFF /* 100% */, 0xff, 0xff, 0xff);
    constexpr SkColor kColorLayerBackgroundDialogDark =
        SkColorSetARGB(0xFF /* 100% */, 0x29, 0x29, 0x29);

    // Autofill
    constexpr SkColor kLightAutofillSecondaryText =
        SkColorSetA(SK_ColorBLACK, 0x99);
    constexpr SkColor kDarkAutofillSecondaryText =
        SkColorSetA(SK_ColorWHITE, 0x99);
    constexpr SkColor kLightAutofillDefaultBackground = SK_ColorWHITE;
    constexpr SkColor kDarkAutofillDefaultBackground = Gray(0x4A);
    constexpr SkColor kLightAutofillPrimaryBackground =
        SkColorSetA(kBaseBlue, 0x1E);
    constexpr SkColor kDarkAutofillPrimaryBackground = Gray(0x74);
    constexpr SkColor kLightAutofillSecondaryBackground = Gray(0xEE);
    constexpr SkColor kLightAutofillBanner = SkColorSetRGB(0xF8, 0xF8, 0xF8);
    constexpr SkColor kDarkAutofillSecondaryBackground =
        SkColorSetA(SK_ColorWHITE, 0x14);
    constexpr SkColor kLightAutofillPrimaryBorder =
        SkColorSetARGB(0xFF, 0x53, 0x94, 0xC8);
    constexpr SkColor kDarkAutofillPrimaryBorder =
        SkColorSetA(Gray(0x74), 0x66);
    constexpr SkColor kLightAutofillSecondaryBorder =
        SkColorSetA(SK_ColorBLACK, 0x66);
    constexpr SkColor kDarkAutofillSecondaryBorder =
        SkColorSetA(SK_ColorWHITE, 0x66);
    constexpr SkColor kAutofillWarningText =
        SkColorSetARGB(0xFF, 0xCC, 0x00, 0x00);
    constexpr SkColor kLightAutofillBubbleText = Gray(0x6C);
    constexpr SkColor kDarkAutofillBubbleText = SK_ColorWHITE;
    constexpr SkColor kLightAutofillBubbleBackgroundSelected = SK_ColorWHITE;
    constexpr SkColor kDarkAutofillBubbleBackgroundSelected = Gray(0xC4);
    constexpr SkColor kDarkAutofillBubbleTextSelected = Gray(0x46);
    constexpr SkColor kDarkColorEdgeAutofillPopupHeaderText =
        SkColorSetARGB(0xD6, 0xFF, 0xFF, 0xFF);
    constexpr SkColor kLightColorEdgeAutofillPopupHeaderText =
        SkColorSetARGB(0xBD, 0x00, 0x00, 0x00);
    constexpr SkColor kDarkColorEdgeAutofillPopupHoverBackground =
        SkColorSetA(SK_ColorWHITE, 0x0F);
    constexpr SkColor kLightColorEdgeAutofillPopupHoverBackground =
        SkColorSetA(SK_ColorBLACK, 0x0A);

    // Autofill Password Account Creation
    constexpr SkColor kAccountCreationLockIcon =
        SkColorSetARGB(0xff, 0x1F, 0x65, 0xf1);
    constexpr SkColor kAccountCreationLockIconDark =
        SkColorSetARGB(0xff, 0x7d, 0xba, 0xe9);
    constexpr SkColor kAccountCreationToggleTrackOnLight =
        SkColorSetARGB(0xff, 0x38, 0x95, 0xDE);
    constexpr SkColor kAccountCreationToggleTrackOnDark =
        SkColorSetARGB(0xff, 0x23, 0x8A, 0xDA);
    constexpr SkColor kAccountCreationToggleTrackOffLight =
        SkColorSetARGB(0xff, 0x8F, 0x8F, 0x8F);
    constexpr SkColor kAccountCreationToggleTrackOffDark =
        SkColorSetARGB(0xff, 0x91, 0x91, 0x91);
    constexpr SkColor kAccountCreationToggleThumbOnLight =
        SkColorSetARGB(0xff, 0x03, 0x46, 0x7A);
    constexpr SkColor kAccountCreationToggleThumbOnDark =
        SkColorSetARGB(0xff, 0xF2, 0xF8, 0xFD);
    constexpr SkColor kAccountCreationToggleThumbOffLight =
        SkColorSetARGB(0xff, 0x42, 0x42, 0x42);
    constexpr SkColor kAccountCreationToggleThumbOffDark =
        SkColorSetARGB(0xff, 0xff, 0xff, 0xff);
    constexpr SkColor kAccountCreationToggleBorderLight =
        SkColorSetARGB(0xff, 0x76, 0x76, 0x76);
    constexpr SkColor kAccountCreationToggleBorderDark =
        SkColorSetARGB(0xff, 0x66, 0x66, 0x66);

    // Autofill Password Generation
    constexpr SkColor kPasswordGenerationFooterBackgroundLight =
        SkColorSetARGB(0xff, 0xf7, 0xf7, 0xf7);
    constexpr SkColor kPasswordGenerationFooterBackgroundDark =
        SkColorSetARGB(0xff, 0x3B, 0x3B, 0x3B);
    constexpr SkColor kPasswordGenerationFooterSeparatorLight =
        SkColorSetARGB(0xff, 0xe5, 0xe5, 0xe5);
    constexpr SkColor kPasswordGenerationFooterSeparatorDark =
        SkColorSetARGB(0xff, 0x3B, 0x3B, 0x3B);
    constexpr SkColor kPasswordGenerationEditFailBackgroundLight =
        SkColorSetARGB(0xff, 0xf9, 0xdf, 0xd5);
    constexpr SkColor kPasswordGenerationEditFailBackgroundDark =
        SkColorSetARGB(0xff, 0x4D, 0x15, 0x00);
    constexpr SkColor kPasswordGenerationFooterBorderColorLight =
        SkColorSetARGB(0xff, 0x76, 0x76, 0x76);
    constexpr SkColor kPasswordGenerationFooterBorderColorDark =
        SkColorSetARGB(0xff, 0xa5, 0xa5, 0xa5);
    constexpr SkColor kPasswordGenerationFooterSelectedBackgroundLight =
        SkColorSetARGB(0xff, 0xe5, 0xe5, 0xe5);
    constexpr SkColor kPasswordGenerationFooterSelectedBackgroundDark =
        SkColorSetARGB(0xff, 0x4a, 0x4a, 0x4a);
    constexpr SkColor kPasswordGenerationRefreshBackgroundLight =
        SkColorSetARGB(0xff, 0x94, 0x94, 0x94);
    constexpr SkColor kPasswordGenerationRefreshBackgroundDark =
        SkColorSetARGB(0xff, 0x62, 0x62, 0x62);
    constexpr SkColor kEdgeSelectedBackgroundPasswordColorLight =
        SkColorSetARGB(0xff, 0x94, 0x94, 0x94);
    constexpr SkColor kEdgeSelectedBackgroundPasswordColorDark =
        SkColorSetARGB(0xff, 0x20, 0x44, 0x61);
    constexpr SkColor kEdgeDropdownBackgroundColorLight = SK_ColorWHITE;
    constexpr SkColor kEdgeDropdownBackgroundColorDark =
        SkColorSetARGB(0xff, 0x4A, 0x4A, 0x4A);
    constexpr SkColor kPasswordGenerationEditBackgroundLight =
        SkColorSetARGB(0xff, 0xfe, 0xfa, 0xeb);
    constexpr SkColor kPasswordGenerationEditBackgroundDark =
        SkColorSetARGB(0xff, 0x39, 0x2F, 0x03);

    // Edge wallet
    constexpr SkColor kEdgeWalletEntrySubtitleText = Gray(0x46);
    constexpr SkColor kEdgeWalletEntryCloseButtonBorderLeftLight =
        SkColorSetARGB(0xFF, 0xB5, 0xE6, 0xC7);
    constexpr SkColor kEdgeWalletEntryCloseButtonBorderLeftDark = SK_ColorWHITE;
    constexpr SkColor kEdgeWalletEntryCloseButtonBorderRightLight =
        SkColorSetARGB(0xFF, 0xB4, 0xD5, 0xE7);
    constexpr SkColor kEdgeWalletEntryCloseButtonBorderRightDark =
        SK_ColorWHITE;
    constexpr SkColor kEdgeWalletEntryIconBackplateLight =
        SkColorSetARGB(0x14, 0x04, 0x73, 0xCE);
    constexpr SkColor kEdgeWalletEntryIconBackplateDark =
        SkColorSetARGB(0xFF, 0x4C, 0x59, 0x63);
    constexpr SkColor kEdgeWalletAvailableBalanceLight =
        SkColorSetRGB(0x10, 0x7C, 0x10);
    constexpr SkColor kEdgeWalletAvailableBalanceDark =
        SkColorSetRGB(0x7F, 0xDA, 0x91);
    constexpr SkColor kEdgeWalletPendingBalanceLight =
        SkColorSetRGB(0x61, 0x61, 0x61);
    constexpr SkColor kEdgeWalletPendingBalanceDark =
        SkColorSetRGB(0xD8, 0xD8, 0xD8);

    // Autofill Password breach
    constexpr SkColor kColorPasswordBreachDetectionBubbleBannerBackgroundLight =
        SkColorSetARGB(0xff, 0xec, 0xf7, 0xff);
    constexpr SkColor kColorPasswordBreachDetectionBubbleBannerBackgroundDark =
        SkColorSetARGB(0xff, 0x00, 0x3b, 0x68);

    constexpr SkColor
        kColorPasswordBreachDetectionBubbleCredentialsBackgroundLight =
            SkColorSetARGB(0xff, 0xf9, 0xdf, 0xd5);
    constexpr SkColor
        kColorPasswordBreachDetectionBubbleCredentialsBackgroundDark =
            SkColorSetARGB(0xff, 0x83, 0x24, 0x01);

    constexpr SkColor kColorPasswordBreachDetectionConsentBackgroundLight =
        SkColorSetARGB(0x1a, 0x00, 0x78, 0xd4);
    constexpr SkColor kColorPasswordBreachDetectionConsentBackgroundDark =
        SkColorSetARGB(0x29, 0x00, 0x78, 0xd4);

    constexpr SkColor kColorPasswordMonitorNoticeBubbleSeparatorLight =
        SkColorSetARGB(0x19, 0x00, 0x00, 0x00);
    constexpr SkColor kColorPasswordMonitorNoticeBubbleSeparatorDark =
        SkColorSetARGB(0x19, 0xff, 0xff, 0xff);

    // Autofill Password Save/Update
    constexpr SkColor kPasswordSaveEditButtonLight =
        SkColorSetRGB(0x00, 0x78, 0xd4);
    constexpr SkColor kPasswordSaveEditButtonDark =
        SkColorSetRGB(0x63, 0xAD, 0xE5);
    constexpr SkColor kCPPCreateSuggestionBackgroundLight =
        SkColorSetRGB(0xFF, 0xF7, 0xE3);
    constexpr SkColor kCPPCreateSuggestionBackgroundDark =
        SkColorSetRGB(0x51, 0x49, 0x35);
    constexpr SkColor kCPPCreateSuggestionButtonLight =
        SkColorSetRGB(0x00, 0x72, 0xC9);
    constexpr SkColor kCPPCreateSuggestionButtonDark =
        SkColorSetRGB(0x86, 0xBF, 0xEB);

    constexpr SkColor kColorPasswordSavenotNowDropDownActiveLight =
        SkColorSetARGB(0x4D, 0x00, 0x00, 0x00);
    constexpr SkColor kColorPasswordSavenotNowDropDownActiveDark =
        SkColorSetARGB(0x4D, 0xff, 0xff, 0xff);

    constexpr SkColor kTextFieldFocusBorderBlueLight =
        SkColorSetRGB(0x21, 0x69, 0xEB);
    constexpr SkColor kTextFieldFocusBorderBlueDark =
        SkColorSetRGB(0x40, 0x82, 0xF5);
    constexpr SkColor kTextFieldTopBorderLight =
        SkColorSetARGB(0x2E, 0x00, 0x00, 0x00);
    constexpr SkColor kTextFieldTopBorderDark =
        SkColorSetARGB(0x4A, 0xFF, 0xFF, 0xFF);
    constexpr SkColor kTextFieldBottomBorderLight =
        SkColorSetARGB(0x9E, 0x00, 0x00, 0x00);
    constexpr SkColor kTextFieldBottomBorderDark =
        SkColorSetARGB(0xFF, 0xFF, 0xFF, 0xFF);
    constexpr SkColor kPasswordNotNowButtonLight =
        SkColorSetA(SK_ColorWHITE, 0x2B);
    constexpr SkColor kPasswordNotNowButtonDark =
        SkColorSetA(SK_ColorWHITE, 0x0A);
    constexpr SkColor kPasswordSaveButtonLight =
        SkColorSetRGB(0x21, 0x69, 0xEB);
    constexpr SkColor kPasswordSaveButtonDark = SkColorSetRGB(0x23, 0x5C, 0xCF);

    // Downloads Hub Ring
    constexpr SkColor kLightDownloadsCompleteIcon =
      SkColorSetRGB(0x18, 0x80, 0x38);
    constexpr SkColor kLightDownloadsErrorIcon =
      SkColorSetRGB(0xD9, 0x30, 0x25);
    constexpr SkColor kLightDownloadsWarningIcon =
      SkColorSetRGB(0xF2, 0x99, 0x00);
    constexpr SkColor kDarkDownloadsCompleteIcon =
      SkColorSetRGB(0x81, 0xC9, 0x95);
    constexpr SkColor kDarkDownloadsErrorIcon =
      SkColorSetRGB(0xF2, 0x8B, 0x82);
    constexpr SkColor kDarkDownloadsWarningIcon =
      SkColorSetRGB(0xFD, 0xD6, 0x63);

    // Reading View
    constexpr SkColor kDarkReadingViewIconAnimationIcon = Gray(0xAF);
    constexpr SkColor kDarkReadingViewIconAnimationText =
        SkColorSetRGB(0x4C, 0x98, 0xD1);

    // Edge Extensions
    constexpr SkColor kColorEdgeExtensionsFrictionBubbleSeparatorLight =
        SkColorSetARGB(0x19, 0x00, 0x00, 0x00);
    constexpr SkColor kColorEdgeExtensionsFrictionBubbleSeparatorDark =
        SkColorSetARGB(0x19, 0xff, 0xff, 0xff);

    // Edge Underside Competitive Search
    constexpr SkColor kCompetitiveSearchBackgroundLight = SK_ColorWHITE;
    constexpr SkColor kCompetitiveSearchBackgroundDark =
        SkColorSetRGB(0x3B, 0x3B, 0x3B);
    constexpr SkColor kCompetitiveSearchEngineBackgroundLight = SK_ColorWHITE;
    constexpr SkColor kCompetitiveSearchEngineBackgroundDark =
        SkColorSetRGB(0x3B, 0x3B, 0x3B);
    constexpr SkColor kCompetitiveSearchEngineUnderlineLight =
        SkColorSetRGB(0x00, 0x78, 0xD4);
    constexpr SkColor kCompetitiveSearchEngineUnderlineDark =
        SkColorSetRGB(0x8A, 0xB4, 0xF8);
    constexpr SkColor kCompetitiveSearchEngineLabelLight = SK_ColorBLACK;
    constexpr SkColor kCompetitiveSearchEngineLabelDark = SK_ColorWHITE;

    // Edge search bar
    constexpr SkColor kColorEdgeSearchbarHighlightedButton =
        SkColorSetARGB(0xFF, 0x03, 0x6A, 0xC4);

    // Edge Windows Copilot
    constexpr SkColor kEdgeCopilotHeaderBackgroundLight = Gray(0xF3);
    constexpr SkColor kEdgeCopilotHeaderBackgroundDark = Gray(0x20);
    constexpr SkColor kEdgeCopilotPreviewLight = Gray(0x5F);
    constexpr SkColor kEdgeCopilotPreviewDark = Gray(0xC8);

    // Edge Shoreline Search
    constexpr SkColor kShorelineSearchScopeButtonUnderlineLight =
        SkColorSetRGB(0x00, 0x78, 0xD4);
    constexpr SkColor kShorelineSearchScopeButtonUnderlineDark =
        SkColorSetRGB(0x8A, 0xB4, 0xF8);
    constexpr SkColor kShorelineSearchZeroInputRowIconLight =
        SkColorSetRGB(0x71, 0x71, 0x71);
    constexpr SkColor kShorelineSearchZeroInputRowIconDark =
        SkColorSetRGB(0x90, 0x90, 0x90);
    constexpr SkColor kShorelineSearchZeroInputRowLabelLight =
        SkColorSetRGB(0x1A, 0x1A, 0x1A);
    constexpr SkColor kShorelineSearchZeroInputRowLabelDark = SK_ColorWHITE;
    constexpr SkColor kShorelineSearchButton =
        SkColorSetRGB(0x93, 0x93, 0x93);
    constexpr SkColor kShorelineSearchButtonHoverLight =
        SkColorSetRGB(0x73, 0x73, 0x73);
    constexpr SkColor kShorelineSearchButtonHoverDark =
        SkColorSetRGB(0xE0, 0xE0, 0xE0);
    constexpr SkColor kShorelineSearchButtonPressedLight =
        SkColorSetRGB(0x5A, 0x5A, 0x5A);
    constexpr SkColor kShorelineSearchButtonPressedDark =
        SkColorSetRGB(0xFB, 0xFB, 0xFB);
    constexpr SkColor kShorelineSearchRefreshButtonLight =
        SkColorSetRGB(0x03, 0x6A, 0xC4);
    constexpr SkColor kShorelineSearchRefreshButtonDark =
        SkColorSetRGB(0x8A, 0xB4, 0xF8);

    // Edge Shoreline Omnibox Notifications
    constexpr SkColor kShorelineOmniboxNotificationLabelLight =
        SkColorSetRGB(0x23, 0x5C, 0xCF);
    constexpr SkColor kShorelineOmniboxNotificationLabelDark =
        SkColorSetRGB(0x69, 0xA1, 0xFA);
    constexpr SkColor kShorelineOmniboxNotificationLabelHoverLight =
        SkColorSetRGB(0x25, 0x51, 0xA8);
    constexpr SkColor kShorelineOmniboxNotificationLabelHoverDark =
        SkColorSetRGB(0x86, 0xB3, 0xFC);
    constexpr SkColor kShorelineOmniboxNotificationIconLight =
        SkColorSetRGB(0x76, 0x76, 0x76);
    constexpr SkColor kShorelineOmniboxNotificationIconDark =
        SkColorSetRGB(0x92, 0x92, 0x92);
    constexpr SkColor kShorelineOmniboxNotificationIconHoverLight =
        SK_ColorBLACK;
    constexpr SkColor kShorelineOmniboxNotificationIconHoverDark =
        SK_ColorWHITE;
    constexpr SkColor kShorelineOmniboxNotificationBackgroundLight =
        SkColorSetRGB(0xE0, 0xED, 0xFF);
    constexpr SkColor kShorelineOmniboxNotificationBackgroundDark =
        SkColorSetRGB(0x24, 0x39, 0x66);

    // Edge notification
    constexpr SkColor kEdgeNotificationIconLight = Gray(0x76);
    constexpr SkColor kEdgeNotificationIconDark = Gray(0xBE);

    // Edge progress ring close button
    constexpr SkColor kEdgeProgressRingForegroundLight =
        SkColorSetRGB(0x03, 0x6E, 0xC9);
    constexpr SkColor kEdgeProgressRingBackgroundLight = Gray(0xE5);
    constexpr SkColor kEdgeProgressRingForegroundDark =
        SkColorSetRGB(0xDB, 0xFF, 0xFF);
    constexpr SkColor kEdgeProgressRingBackgroundDark = Gray(0x67);
    constexpr SkColor kEdgeProgressRingCloseIconPausedLight = Gray(0x1A);
    constexpr SkColor kEdgeProgressRingCloseIconPausedDark = SK_ColorWHITE;

    // Edge Rewards
    constexpr SkColor kRewardsCoachmarkJoinLight =
        SkColorSetRGB(0x11, 0x47, 0x76);
    constexpr SkColor kRewardsCoachmarkLearnMoreLight =
        SkColorSetRGB(0xDC, 0xE9, 0xF3);

    // Edge split window.
    constexpr SkColor kSplitWindowInactiveColor = SkColorSetARGB(0x1f, 0, 0, 0);
    constexpr SkColor kSplitWindowActiveColor = SkColorSetRGB(0x2c, 0x62, 0xdb);
    constexpr SkColor kSplitWindowInactiveTabColor =
        SkColorSetARGB(0x14, 0, 0, 0);
    constexpr SkColor kSplitWindowDragDropInactiveLight =
        SkColorSetA(SK_ColorBLACK, 0x3d);
    constexpr SkColor kSplitWindowDragDropInactiveDark =
        SkColorSetA(SK_ColorWHITE, 0x52);
    constexpr SkColor kSplitWindowDragDropForegroundActiveLight =
        SkColorSetRGB(0x21, 0x69, 0xeb);
    constexpr SkColor kSplitWindowDragDropForegroundActiveDark =
        SkColorSetRGB(0x69, 0xa1, 0xfa);
    constexpr SkColor kSplitWindowDragDropBackGroundActiveLight =
        SkColorSetARGB(0x1f, 0x00, 0x78, 0xd4);
    constexpr SkColor kSplitWindowDragDropBackGroundActiveDark =
        SkColorSetARGB(0x3d, 0x23, 0x5c, 0xcf);

    // Edge Smart Switch
    constexpr SkColor kEdgeSmartSwitchBackgroundLight = Gray(0xF5);
    constexpr SkColor kEdgeSmartSwitchBackgroundDark = Gray(0x20);

    // Edge Workspaces Theme Colors
    constexpr SkColor kWorkspacesBlueLight = SkColorSetRGB(0x21, 0x69, 0xEB);
    constexpr SkColor kWorkspacesBlueDark = SkColorSetRGB(0x69, 0xA1, 0xFA);
    constexpr SkColor kWorkspacesTealLight = SkColorSetRGB(0x00, 0x66, 0x6D);
    constexpr SkColor kWorkspacesTealDark = SkColorSetRGB(0x58, 0xD3, 0xDB);
    constexpr SkColor kWorkspacesGreenLight = SkColorSetRGB(0x57, 0x81, 0x1B);
    constexpr SkColor kWorkspacesGreenDark = SkColorSetRGB(0xA4, 0xCC, 0x6C);
    constexpr SkColor kWorkspacesVioletLight = SkColorSetRGB(0xB1, 0x46, 0xC2);
    constexpr SkColor kWorkspacesVioletDark = SkColorSetRGB(0xCF, 0x87, 0xDA);
    constexpr SkColor kWorkspacesPinkLight = SkColorSetRGB(0xE3, 0x00, 0x8C);
    constexpr SkColor kWorkspacesPinkDark = SkColorSetRGB(0xEE, 0x5F, 0xB7);
    constexpr SkColor kWorkspacesBrownLight = SkColorSetRGB(0x8F, 0x4E, 0x00);
    constexpr SkColor kWorkspacesBrownDark = SkColorSetRGB(0xFF, 0xBA, 0x66);
    constexpr SkColor kWorkspacesOrangeLight = SkColorSetRGB(0xB6, 0x48, 0x0E);
    constexpr SkColor kWorkspacesOrangeDark = SkColorSetRGB(0xDF, 0x8E, 0x64);
    constexpr SkColor kWorkspacesGrayLight = SkColorSetRGB(0x5D, 0x5A, 0x58);
    constexpr SkColor kWorkspacesGrayDark = SkColorSetRGB(0x9E, 0x9B, 0x99);
    constexpr SkColor kWorkspacesRedLight = SkColorSetRGB(0xC4, 0x35, 0x01);
    constexpr SkColor kWorkspacesRedDark = SkColorSetRGB(0xE9, 0x83, 0x5E);
    constexpr SkColor kWorkspacesDarkGrayLight =
        SkColorSetRGB(0x39, 0x39, 0x39);
    constexpr SkColor kWorkspacesDarkGrayDark = SkColorSetRGB(0xDF, 0xDF, 0xDF);
    constexpr SkColor kWorkspacesPurpleLight = SkColorSetRGB(0x82, 0x30, 0xFF);
    constexpr SkColor kWorkspacesPurpleDark = SkColorSetRGB(0xAB, 0x85, 0xFF);
    constexpr SkColor kWorkspacesDarkGreenLight =
        SkColorSetRGB(0x00, 0x72, 0x3B);
    constexpr SkColor kWorkspacesDarkGreenDark =
        SkColorSetRGB(0x5A, 0xE0, 0xA0);
    constexpr SkColor kWorkspacesRoyalBlueLight =
        SkColorSetRGB(0x00, 0x4E, 0x8C);
    constexpr SkColor kWorkspacesRoyalBlueDark =
        SkColorSetRGB(0xC7, 0xDC, 0xED);

    // Edge PWA Sidebar Theme Colors
    constexpr SkColor kPwaSidebarBackgroundLightBlue =
        SkColorSetRGB(0xE3, 0xEF, 0xFF);
    constexpr SkColor kPwaSidebarBackgroundDarkBlue =
        SkColorSetRGB(0x24, 0x39, 0x66);
    constexpr SkColor kPwaSidebarIconLightBlue =
        SkColorSetRGB(0x21, 0x69, 0xEB);
    constexpr SkColor kPwaSidebarIconDarkBlue = SkColorSetRGB(0x4D, 0x8D, 0xFA);

    // Edge PWA Install Colors
    constexpr SkColor kPwaInstallIconLightGreen =
        SkColorSetRGB(0x97, 0xCD, 0x7E);

    // Browser essentials theme colors
    constexpr SkColor kBrowserEssentialsNativeHeaderDark =
        SkColorSetRGB(0x1f, 0x1f, 0x1f);
    constexpr SkColor kBrowserEssentialsNativeHeaderLight =
        SkColorSetRGB(0xfa, 0xfa, 0xfa);

    // Edge Notification Dot Colors
    constexpr SkColor kLightModeNotificationDotBlue =
        SkColorSetRGB(0x21, 0x69, 0xEB);
    constexpr SkColor kDarkModeNotificationDotBlue =
        SkColorSetRGB(0x23, 0x5C, 0xCF);

    constexpr SkColor kLightModeNotificationDotRed =
        SkColorSetRGB(0xC4, 0x35, 0x01);
    constexpr SkColor kDarkModeNotificationDotRed =
        SkColorSetRGB(0xE9, 0x83, 0x5E);
    constexpr SkColor kNotificationDotRestingStrokeGray = Gray(0xF0);
    constexpr SkAlpha kLightModeNotificationDotPulseMaxAlpha = 0x33;
    constexpr SkAlpha kDarkModeNotificationDotPulseMaxAlpha = 0x66;

    // Edge Fluent AI Gradient Colors
    constexpr SkColor kEdgeFluentAIGradientBlueLight =
        SkColorSetRGB(0x29, 0x6E, 0xEB);
    constexpr SkColor kEdgeFluentAIGradientBlueDark =
        SkColorSetRGB(0x4D, 0x8D, 0xFA);
    constexpr SkColor kEdgeFluentAIGradientTeal =
        SkColorSetRGB(0x6C, 0xEB, 0xE2);
    constexpr SkColor kEdgeFluentAIGradientGreen =
        SkColorSetRGB(0x34, 0xCF, 0xA9);

    // Edge Tab Auto-grouping feature progress bar colors
    constexpr SkColor kTabAutoGroupingProgressBarBackgroundColorLight =
        SkColorSetRGB(230, 230, 230);
    constexpr SkColor kTabAutoGroupingProgressBarBackgroundColorDark =
        SkColorSetRGB(51, 51, 51);
    constexpr SkColor kTabAutoGroupingProgressBarMaskColor =
        SkColorSetRGB(0x0F, 0x0F, 0x0F);

    constexpr SkColor kTabAutoGroupingStopGeneratingButtonHighlight =
        SkColorSetARGB(219, 0, 0, 0);

    // Edge Visual Companion Colors
    constexpr SkColor kVisualCompanionThemeColorLight =
        SkColorSetRGB(0xFB, 0xDD, 0xC7);
    constexpr SkColor kVisualCompanionThemeColorDark =
        SkColorSetRGB(0x19, 0x22, 0x3D);
    constexpr SkColor kVisualCompanionActiveTabColorLight =
        SkColorSetRGB(0xFF, 0xE9, 0xD5);
    constexpr SkColor kVisualCompanionActiveTabColorDark =
        SkColorSetRGB(0x2C, 0x39, 0x61);
    constexpr SkColor kVisualCompanionGrabBarBorderDark =
        SkColorSetARGB(0x14, 0xFF, 0xFF, 0xFF);
    constexpr SkColor kVisualCompanionGrabBarBorderLight =
        SkColorSetARGB(0xB3, 0xFF, 0xFF, 0xFF);
    constexpr SkColor kVisualCompanionGrabBarBackgroundColorLight =
        SkColorSetRGB(0xEF, 0xEB, 0xE7);
    constexpr SkColor kVisualCompanionGrabBarBackgroundColorDark =
        SkColorSetRGB(0x33, 0x35, 0x3E);

    // Edge Fluent UI Colors.
    constexpr SkColor kColorNeutralBackground1Light =
        SkColorSetA(SK_ColorWHITE, 0xB2);
    constexpr SkColor kColorNeutralBackground1Dark =
        SkColorSetA(SK_ColorWHITE, 0x0B);
    constexpr SkColor kColorNeutralBackground4Light =
        SkColorSetA(SK_ColorBLACK, 0x0F);
    constexpr SkColor kColorNeutralBackground4Dark =
        SkColorSetARGB(0x2E, 0x3A, 0x3A, 0x3A);
    constexpr SkColor kColorNeutralForeground1Light =
        SkColorSetA(SK_ColorBLACK, 0xDB);
    constexpr SkColor kColorNeutralForeground1Dark = SK_ColorWHITE;
    constexpr SkColor kColorNeutralForegroundHintLight =
        SkColorSetA(SK_ColorBLACK, 0x8F);
    constexpr SkColor kColorNeutralForegroundHintDark =
        SkColorSetA(SK_ColorWHITE, 0x85);
    constexpr SkColor kColorNeutralStroke1Light =
        SkColorSetA(SK_ColorBLACK, 0x2E);
    constexpr SkColor kColorNeutralStroke1Dark =
        SkColorSetA(SK_ColorWHITE, 0x49);

    // Edge Game Assist colors
    constexpr SkColor kGameAssistBackgroundDark =
        SkColorSetRGB(0x25, 0x28, 0x2C);
    constexpr SkColor kGameAssistBackgroundLight = SK_ColorWHITE;

  } // namespace edge
}  // namespace gfx

#endif  // UI_GFX_EDGE_COLOR_PALETTE_H_
