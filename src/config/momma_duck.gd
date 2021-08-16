tool
extends DefaultAppManifest


# ---

# This method is useful for defining parameters that are likely to change
# between builds or between development and production environments.
func _override_configs_for_current_run() -> void:
    # TODO: Remember to reset these when creating releases.
    
    var is_debug := true and OS.is_debug_build()
    var is_playtest := false
    
#    var debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.default
    var debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.full_screen
#    var debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.google_ads_portrait
    
    _metadata.app_version = "0.0.1"
    
    _metadata.debug = true and OS.is_debug_build()
    _metadata.playtest = false
    _metadata.pauses_on_focus_out = false
    _metadata.also_prints_to_stdout = true
    _metadata.logs_character_events = true
    _metadata.logs_analytics_events = false
    _metadata.logs_bootstrap_events = false
#    _metadata.logs_bootstrap_events = false
    _metadata.logs_device_settings = false
    _metadata.logs_in_editor_events = true
    _metadata.are_all_levels_unlocked = false
    _metadata.are_test_levels_included = true
    _metadata.is_save_state_cleared_for_debugging = false
    _metadata.opens_directly_to_level_id = "5"
    _metadata.is_splash_skipped = true
    _metadata.are_button_controls_enabled_by_default = false
    
    _surfacer_manifest.precompute_platform_graph_for_levels = [
#        "1",
#        "2",
#        "3",
#        "4",
#        "5",
    ]
    _surfacer_manifest.ignores_platform_graph_save_files = false
    
    _gui_manifest.debug_window_size = debug_window_size
    _gui_manifest.hud_manifest.is_inspector_enabled_default = false
    
    _derive_overrides_according_to_debug_or_playtest(app_manifest)

# ---

const INCLUDES_LEASH_SETTINGS_KEY := "includes_leash"

var _is_using_pixel_style := true

var _uses_threads := false and OS.can_use_threads()

var _metadata := {
    debug = false,
    playtest = false,
    pauses_on_focus_out = true,
    also_prints_to_stdout = true,
    logs_character_events = true,
    logs_analytics_events = true,
    logs_bootstrap_events = true,
    logs_device_settings = true,
    logs_in_editor_events = true,
    is_profiler_enabled = true,
    are_all_levels_unlocked = true,
    is_splash_skipped = false,
    uses_threads = _uses_threads,
    thread_count = OS.get_processor_count() if _uses_threads else 1,
    is_mobile_supported = true,
    rng_seed = 176,
    uses_level_scores = false,
    must_restart_level_to_change_settings = true,
    overrides_project_settings = true,
    overrides_input_map = true,
    are_button_controls_enabled_by_default = false,
    base_path = "",
    
    app_name = "Momma Duck",
    app_id = "games.snoringcat.momma_duck",
    app_version = "0.0.1",
    score_version = "0.0.1",
    data_agreement_version = "0.0.1",
    
    # Must start with "UA-".
    google_analytics_id = "UA-186405125-3",
    privacy_policy_url = \
            "https://docs.google.com/document/d/1G90Hna_3ZlXYie3CDPne8vjdP7b3mq1Vqj8agbDsKJ8/preview",
    terms_and_conditions_url = \
            "https://docs.google.com/document/d/1qHZQiJnVJGHMWR0FzwBMCV_9NlMYWRhJKL-7I3hWlGk/preview",
    android_app_store_url = "",
    ios_app_store_url = "",
    support_url = "https://snoringcat.games/support",
    error_logs_url = \
            "https://storage.googleapis.com/upload/storage/v1/b/momma-duck-logs/o",
    app_id_query_param = "momma-duck",
    
    developer_name = "Snoring Cat LLC",
    developer_url = "https://snoringcat.games",
    
    godot_splash_screen_duration = 1.4,
    developer_splash_screen_duration = 1.0,
}

var _images_overrides := {
    app_logo = preload("res://assets/images/logo.png"),
    app_logo_scale = 1.0,
    
    developer_logo = preload( \
            "res://addons/scaffolder/assets/images/logos/snoring_cat_logo_about.png"),
    developer_splash = preload( \
            "res://addons/scaffolder/assets/images/logos/snoring_cat_logo_splash.png"),
    
    go_normal = preload("res://assets/images/go_icon.png"),
    go_scale = 1.5,
}

var _sounds_manifest := [
    {
        name = "fall",
        volume_db = 18.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "menu_select",
        volume_db = -2.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "menu_select_fancy",
        volume_db = -6.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "lock_low",
        volume_db = 0.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "lock_high",
        volume_db = 0.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "walk",
        volume_db = 15.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "achievement",
        volume_db = 12.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "single_cat_snore",
        volume_db = 17.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    
    {
        name = "duck_jump",
        volume_db = -6.0,
        path_prefix = "res://assets/sounds/",
    },
    {
        name = "duck_land",
        volume_db = -2.0,
        path_prefix = "res://assets/sounds/",
    },
    {
        name = "momma_cadence",
        volume_db = 10.0,
        path_prefix = "res://assets/sounds/",
    },
    {
        name = "cadence_lose",
        volume_db = 10.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "duckling_quack",
        volume_db = 2.0,
        path_prefix = "res://assets/sounds/",
    },
    {
        name = "quack",
        volume_db = 1.0,
        path_prefix = "res://assets/sounds/",
    },
    {
        name = "lost_duck",
        volume_db = 1.0,
        path_prefix = "res://assets/sounds/",
    },
    {
        name = "splash",
        volume_db = 1.0,
        path_prefix = "res://assets/sounds/",
    },
    {
        name = "quack_peep",
        volume_db = 1.0,
        path_prefix = "res://assets/sounds/",
    },
]

var _music_manifest := [
    {
        name = "momma_music",
        path_prefix = "res://assets/music/",
        volume_db = 0.0,
        bpm = 112.5,
        meter = 4,
    },
    {
        name = "momma_pause_music",
        path_prefix = "res://assets/music/",
        volume_db = 0.0,
        bpm = 50,
        meter = 4,
    },
#    {
#        name = "on_a_quest",
#        path_prefix = "res://addons/scaffolder/assets/music/",
#        volume_db = 0.0,
#        bpm = 75,
#        meter = 4,
#    },
#    {
#        name = "pause_menu",
#        path_prefix = "res://addons/scaffolder/assets/music/",
#        volume_db = 0.0,
#        bpm = 56.25,
#        meter = 4,
#    },
]

var _audio_manifest := {
    sounds_manifest = _sounds_manifest,
    default_sounds_path_prefix = "res://assets/sounds/",
    default_sounds_file_suffix = ".wav",
    default_sounds_bus_index = 1,
    
    music_manifest = _music_manifest,
    default_music_path_prefix = "res://addons/scaffolder/assets/music/",
    default_music_file_suffix = ".ogg",
    default_music_bus_index = 2,
    
    godot_splash_sound = "quack_peep",
    developer_splash_sound = "single_cat_snore",
    level_end_sound_win = "momma_cadence",
    level_end_sound_lose = "cadence_lose",
    
    main_menu_music = "momma_pause_music",
    game_over_music = "momma_pause_music",
    pause_menu_music = "momma_pause_music",
    default_level_music = "momma_music",
    
    pauses_level_music_on_pause = true,
    
    are_beats_tracked_by_default = false,
    
    is_arbitrary_music_speed_change_supported = false,
    is_music_speed_scaled_with_time_scale = false,
    is_music_speed_scaled_with_additional_debug_time_scale = false,
    
    is_music_paused_in_slow_motion = false,
    is_tick_tock_played_in_slow_motion = false,
    is_slow_motion_start_stop_sound_effect_played = false,
}

var COLOR_BACKGROUND := Color("2f4034")
var COLOR_BACKGROUND_LIGHTER := Color("3c4d41")
var COLOR_BACKGROUND_DARKER := Color("233327")

var COLOR_TEXT := Color("eeeeee")
var COLOR_HEADER := Color("fff12e")
var COLOR_FOCUS := Color("47a65f")

var COLOR_BUTTON := Color("24803b")
var COLOR_BUTTON_LIGHTER := Color("47a65f")
var COLOR_BUTTON_DARKER := Color("0c591f")

var COLOR_SHADOW := Color("88000000")

var HUD_KEY_VALUE_BOX_MODULATE_COLOR := Color(0.1, 0.7, 1.2, 1.0)
var BUTTON_PULSE_MODULATE_COLOR := Color(2.0, 2.0, 2.0, 1.0)

var _colors_manifest := {
    # Scaffolder colors.
    
    # Should match Project Settings > Application > Boot Splash > Bg Color.
    boot_splash_background = \
            ScaffolderColors.DEFAULT_BOOT_SPLASH_BACKGROUND_COLOR,
    # Should match
    #     Project Settings > Rendering > Environment > Default Clear Color.
    background = COLOR_BACKGROUND,
    text = COLOR_TEXT,
    header = COLOR_HEADER,
    focus_border = COLOR_FOCUS,
    link_normal = COLOR_BUTTON_LIGHTER,
    link_hover = COLOR_BUTTON,
    link_pressed = COLOR_BUTTON_DARKER,
    button_normal = COLOR_BUTTON,
    button_pulse_modulate = BUTTON_PULSE_MODULATE_COLOR,
    button_disabled = COLOR_BUTTON_LIGHTER,
    button_focused = COLOR_BUTTON_LIGHTER,
    button_hover = COLOR_BUTTON_LIGHTER,
    button_pressed = COLOR_BUTTON_DARKER,
    button_border = COLOR_TEXT,
    dropdown_normal = COLOR_BACKGROUND,
    dropdown_disabled = COLOR_BACKGROUND_LIGHTER,
    dropdown_focused = COLOR_BACKGROUND_LIGHTER,
    dropdown_hover = COLOR_BACKGROUND_LIGHTER,
    dropdown_pressed = COLOR_BACKGROUND_DARKER,
    dropdown_border = COLOR_BACKGROUND_DARKER,
    tooltip = COLOR_BACKGROUND,
    tooltip_bg = COLOR_TEXT,
    popup_background = COLOR_BACKGROUND_LIGHTER,
    scroll_bar_background = COLOR_BACKGROUND_LIGHTER,
    scroll_bar_grabber_normal = COLOR_BUTTON,
    scroll_bar_grabber_hover = COLOR_BUTTON_LIGHTER,
    scroll_bar_grabber_pressed = COLOR_BUTTON_DARKER,
    slider_background = COLOR_BACKGROUND_DARKER,
    zebra_stripe_even_row = COLOR_BACKGROUND_LIGHTER,
    overlay_panel_background = COLOR_BACKGROUND_DARKER,
    overlay_panel_border = COLOR_TEXT,
    header_panel_background = COLOR_BACKGROUND,
    screen_border = COLOR_TEXT,
    shadow = COLOR_SHADOW,
    
    # Surfacer colors.
    
    click = ScaffolderColors.static_opacify(
            SurfacerColors.WHITE, ScaffolderColors.ALPHA_SLIGHTLY_FAINT),
    surface_click_selection = ScaffolderColors.static_opacify(
            SurfacerColors.WHITE, ScaffolderColors.ALPHA_SOLID),
    grid_indices = ScaffolderColors.static_opacify(
            SurfacerColors.WHITE, ScaffolderColors.ALPHA_FAINT),
    ruler = SurfacerColors.WHITE,
    invalid = SurfacerColors.RED,
    character_position = Color("00db0b"),
    recent_movement = Color("ffda85"),
    inspector_origin = ScaffolderColors.static_opacify(
            SurfacerColors.ORANGE, ScaffolderColors.ALPHA_FAINT),
}

var _styles_manifest_pixel := {
    button_content_margin_left = 16.0,
    button_content_margin_top = 8.0,
    button_content_margin_right = 16.0,
    button_content_margin_bottom = 8.0,
    
    button_shine_margin_left = 6.0,
    button_shine_margin_top = 6.0,
    button_shine_margin_right = 6.0,
    button_shine_margin_bottom = 6.0,
    
    focus_border_nine_patch = \
            preload("res://assets/images/nine_patch/focus_border.png"),
    focus_border_nine_patch_margin_left = 3.5,
    focus_border_nine_patch_margin_top = 3.5,
    focus_border_nine_patch_margin_right = 3.5,
    focus_border_nine_patch_margin_bottom = 3.5,
    focus_border_nine_patch_scale = 3.0,
    focus_border_expand_margin_left = 3.0,
    focus_border_expand_margin_top = 3.0,
    focus_border_expand_margin_right = 3.0,
    focus_border_expand_margin_bottom = 3.0,
    
    button_pressed_nine_patch = \
            preload("res://assets/images/nine_patch/button_pressed.png"),
    button_disabled_nine_patch = \
            preload("res://assets/images/nine_patch/button_hover.png"),
    button_hover_nine_patch = \
            preload("res://assets/images/nine_patch/button_hover.png"),
    button_normal_nine_patch = \
            preload("res://assets/images/nine_patch/button_normal.png"),
    button_nine_patch_margin_left = 3.5,
    button_nine_patch_margin_top = 3.5,
    button_nine_patch_margin_right = 3.5,
    button_nine_patch_margin_bottom = 3.5,
    button_nine_patch_scale = 3.0,
    
    dropdown_pressed_nine_patch = \
            preload("res://assets/images/nine_patch/dropdown_pressed.png"),
    dropdown_disabled_nine_patch = \
            preload("res://assets/images/nine_patch/dropdown_hover.png"),
    dropdown_hover_nine_patch = \
            preload("res://assets/images/nine_patch/dropdown_hover.png"),
    dropdown_normal_nine_patch = \
            preload("res://assets/images/nine_patch/dropdown_normal.png"),
    dropdown_nine_patch_margin_left = 3.5,
    dropdown_nine_patch_margin_top = 3.5,
    dropdown_nine_patch_margin_right = 3.5,
    dropdown_nine_patch_margin_bottom = 3.5,
    dropdown_nine_patch_scale = 3.0,
    
    scroll_track_nine_patch = \
            preload("res://assets/images/nine_patch/scroll_track.png"),
    scroll_track_nine_patch_margin_left = 3.5,
    scroll_track_nine_patch_margin_top = 3.5,
    scroll_track_nine_patch_margin_right = 3.5,
    scroll_track_nine_patch_margin_bottom = 3.5,
    scroll_track_nine_patch_scale = 3.0,
    
    scroll_grabber_pressed_nine_patch = \
            preload("res://assets/images/nine_patch/scroll_grabber_pressed.png"),
    scroll_grabber_hover_nine_patch = \
            preload("res://assets/images/nine_patch/scroll_grabber_hover.png"),
    scroll_grabber_normal_nine_patch = \
            preload("res://assets/images/nine_patch/scroll_grabber_normal.png"),
    scroll_grabber_nine_patch_margin_left = 3.5,
    scroll_grabber_nine_patch_margin_top = 3.5,
    scroll_grabber_nine_patch_margin_right = 3.5,
    scroll_grabber_nine_patch_margin_bottom = 3.5,
    scroll_grabber_nine_patch_scale = 3.0,
    
    slider_track_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/slider_track.png"),
    slider_track_nine_patch_margin_left = 1.5,
    slider_track_nine_patch_margin_top = 1.5,
    slider_track_nine_patch_margin_right = 1.5,
    slider_track_nine_patch_margin_bottom = 1.5,
    slider_track_nine_patch_scale = 3.0,
    
    overlay_panel_border_width = 2,
    
    overlay_panel_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/overlay_panel.png"),
    overlay_panel_nine_patch_margin_left = 3.5,
    overlay_panel_nine_patch_margin_top = 3.5,
    overlay_panel_nine_patch_margin_right = 3.5,
    overlay_panel_nine_patch_margin_bottom = 3.5,
    overlay_panel_nine_patch_scale = 3.0,
    overlay_panel_content_margin_left = 3.0,
    overlay_panel_content_margin_top = 3.0,
    overlay_panel_content_margin_right = 3.0,
    overlay_panel_content_margin_bottom = 3.0,
    
    header_panel_content_margin_left = 0.0,
    header_panel_content_margin_top = 0.0,
    header_panel_content_margin_right = 0.0,
    header_panel_content_margin_bottom = 0.0,
    
    hud_panel_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/overlay_panel.png"),
    hud_panel_nine_patch_margin_left = 3.5,
    hud_panel_nine_patch_margin_top = 3.5,
    hud_panel_nine_patch_margin_right = 3.5,
    hud_panel_nine_patch_margin_bottom = 3.5,
    hud_panel_nine_patch_scale = 3.0,
    hud_panel_content_margin_left = 8.0,
    hud_panel_content_margin_top = 2.0,
    hud_panel_content_margin_right = 8.0,
    hud_panel_content_margin_bottom = 2.0,
    
    screen_shadow_size = 0,
    screen_shadow_offset = Vector2.ZERO,
    screen_border_width = 0,
}

var _settings_item_manifest := {
    groups = {
        main = {
            label = "",
            is_collapsible = false,
            item_classes = [
                LeashIncludedControlRow,
                MusicControlRow,
                SoundEffectsControlRow,
                HapticFeedbackControlRow,
            ],
        },
        annotations = {
            label = "Rendering",
            is_collapsible = true,
            item_classes = [
                RulerAnnotatorControlRow,
                PreselectionTrajectoryAnnotatorControlRow,
                NpcCharacterTrajectoryAnnotatorControlRow,
                ActiveTrajectoryAnnotatorControlRow,
                PreviousTrajectoryAnnotatorControlRow,
                NavigationDestinationAnnotatorControlRow,
                RecentMovementAnnotatorControlRow,
                SurfacesAnnotatorControlRow,
                CharacterPositionAnnotatorControlRow,
                CharacterAnnotatorControlRow,
                LevelAnnotatorControlRow,
            ],
        },
        hud = {
            label = "HUD",
            is_collapsible = true,
            item_classes = [
                InspectorEnabledControlRow,
                DebugPanelControlRow,
            ],
        },
        miscellaneous = {
            label = "Miscellaneous",
            is_collapsible = true,
            item_classes = [
                ButtonControlsControlRow,
                WelcomePanelControlRow,
                IntroChoreographyControlRow,
                CameraZoomControlRow,
                TimeScaleControlRow,
                MetronomeControlRow,
            ],
        },
    },
}

var _pause_item_manifest := [
    LevelControlRow,
    TimeControlRow,
    FastestTimeControlRow,
    FollowersCountControlRow,
    ScareCountControlRow,
]

var _game_over_item_manifest := [
    LevelControlRow,
    TimeControlRow,
    FastestTimeControlRow,
]

var _level_select_item_manifest := [
    TotalPlaysControlRow,
    FastestTimeControlRow,
]

var _hud_manifest := {
    hud_class = SurfacerHud,
    hud_key_value_box_size = \
            ScaffolderGuiConfig.HUD_KEY_VALUE_BOX_DEFAULT_SIZE,
    hud_key_value_box_scene = \
            preload("res://addons/scaffolder/src/gui/hud/hud_key_value_box.tscn"),
    hud_key_value_list_scene = \
            preload("res://addons/scaffolder/src/gui/hud/hud_key_value_list.tscn"),
    hud_key_value_list_item_manifest = [
        {
            item_class = TimeControlRow,
            settings_enablement_label = "Time",
            enabled_by_default = true,
            settings_group_key = "hud",
        },
        {
            item_class = FollowersCountControlRow,
            settings_enablement_label = "Ducklings in tow",
            enabled_by_default = true,
            settings_group_key = "hud",
            animation = {
                modulate_color = HUD_KEY_VALUE_BOX_MODULATE_COLOR,
                duration = 0.5,
            },
        },
    ],
    is_inspector_enabled_default = false,
    inspector_panel_starts_open = false,
}

var _welcome_panel_manifest := {
    items = [
        ["Lead your ducklings to the pond"],
        ["*Auto nav*", "click"],
        ["Walk/Climb", "arrow key / wasd"],
        ["Jump", "space / x"],
    ],
    header_color = [
    ],
    body_color = [
    ],
}

var _screen_manifest := {
    screens = [
        preload("res://addons/scaffolder/src/gui/screens/about_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/data_agreement_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/developer_splash_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/game_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/game_over_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/godot_splash_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/level_select_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/main_menu_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/notification_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/pause_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/scaffolder_loading_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/settings_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/third_party_licenses_screen.tscn"),
        preload("res://addons/surfacer/src/gui/screens/precompute_platform_graphs_screen.tscn"),
        preload("res://addons/surfacer/src/gui/screens/surfacer_loading_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/confirm_data_deletion_screen_local.tscn"),
#        preload("res://addons/scaffolder/src/gui/screens/scaffolder_loading_screen.tscn"),
#        preload("res://addons/scaffolder/src/gui/screens/confirm_data_deletion_screen_with_analytics.tscn"),
#        preload("res://addons/scaffolder/src/gui/screens/rate_app_screen.tscn"),
    ],
    overlay_mask_transition_fade_in_texture = \
            preload("res://addons/scaffolder/assets/images/transition_masks/radial_mask_transition_in.png"),
    overlay_mask_transition_fade_out_texture = \
            preload("res://addons/scaffolder/assets/images/transition_masks/radial_mask_transition_in.png"),
    screen_mask_transition_fade_texture = \
            preload("res://addons/scaffolder/assets/images/transition_masks/checkers_mask_transition.png"),
    overlay_mask_transition_class = OverlayMaskTransition,
    screen_mask_transition_class = ScreenMaskTransition,
    slide_transition_duration = 0.3,
    fade_transition_duration = 0.3,
    overlay_mask_transition_duration = 1.2,
    screen_mask_transition_duration = 1.2,
    slide_transition_easing = "ease_in_out",
    fade_transition_easing = "ease_in_out",
    overlay_mask_transition_fade_in_easing = "ease_out",
    overlay_mask_transition_fade_out_easing = "ease_in",
    screen_mask_transition_easing = "ease_in",
    default_transition_type = ScreenTransition.FADE,
    fancy_transition_type = ScreenTransition.SCREEN_MASK,
    overlay_mask_transition_color = Color("111111"),
    overlay_mask_transition_uses_pixel_snap = false,
    overlay_mask_transition_smooth_size = 0.02,
    screen_mask_transition_uses_pixel_snap = true,
    screen_mask_transition_smooth_size = 0.0,
}

var _gui_manifest := {
    debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.full_screen,
    
    cell_size = Vector2(32.0, 32.0),
    default_pc_game_area_size = Vector2(1024, 768),
    default_mobile_game_area_size = Vector2(500, 600),
    aspect_ratio_max = 2.0 / 1.0,
    aspect_ratio_min = 1.0 / 2.0,
    camera_smoothing_speed = 10.0,
    default_camera_zoom = 0.4,
    button_height = 56.0,
    button_width = 230.0,
    screen_body_width = 460.0,
    
    is_data_deletion_button_shown = true,
    
    is_suggested_button_shine_line_shown = true,
    is_suggested_button_color_pulse_shown = true,
    
    third_party_license_text = \
            ScaffolderThirdPartyLicenses.TEXT + \
            SurfacerThirdPartyLicenses.TEXT + \
            ThirdPartyLicenses.TEXT,
    special_thanks_text = """
""",
    
    main_menu_image_scale = 1.0,
    game_over_image_scale = 1.0,
    loading_image_scale = 0.5,
    
    main_menu_image_scene = \
            preload("res://src/gui/loading_image.tscn"),
    game_over_image_scene = \
            preload("res://src/gui/loading_image.tscn"),
    loading_image_scene = \
            preload("res://src/gui/loading_image.tscn"),
    welcome_panel_scene = \
            preload("res://addons/scaffolder/src/gui/welcome_panel.tscn"),
    debug_panel_scene = \
            preload("res://addons/scaffolder/src/gui/debug_panel.tscn"),
    
    theme = preload("res://addons/scaffolder/src/config/scaffolder_default_theme.tres"),
    
    fonts_manifest = _default_fonts_manifest_normal,
    settings_item_manifest = _settings_item_manifest,
    pause_item_manifest = _pause_item_manifest,
    game_over_item_manifest = _game_over_item_manifest,
    level_select_item_manifest = _level_select_item_manifest,
    hud_manifest = _hud_manifest,
    welcome_panel_manifest = _welcome_panel_manifest,
    screen_manifest = _screen_manifest,
    
    splash_scale_pc = 1.0,
    splash_scale_mobile = 0.77,
}

var _slow_motion_manifest := {
    time_scale = 1.0,
    tick_tock_tempo_multiplier = 1,
    saturation = 0.5,
}

var _input_map = ScaffolderProjectSettings.DEFAULT_INPUT_MAP

var _character_scenes := [
    preload("res://src/characters/duckling/duckling.tscn"),
    preload("res://src/characters/fox/fox.tscn"),
    preload("res://src/characters/momma/momma.tscn"),
    preload("res://src/characters/porcupine/porcupine.tscn"),
    preload("res://src/characters/run_away_duckling/run_away_duckling.tscn"),
    preload("res://src/characters/spider/spider.tscn"),
]

var _character_manifest := {
    default_character_name = "momma",
    character_scenes = _character_scenes,
}

var _additional_metric_keys := [
]

var _surfacer_debug_params := {
}

var _annotations_manifest := {
    is_player_current_nav_trajectory_shown_with_slow_mo = false,
    is_npc_current_nav_trajectory_shown_with_slow_mo = true,
    is_player_current_nav_trajectory_shown_without_slow_mo = true,
    is_npc_current_nav_trajectory_shown_without_slow_mo = false,
    is_player_nav_pulse_shown_with_slow_mo = false,
    is_npc_nav_pulse_shown_with_slow_mo = true,
    is_player_nav_pulse_shown_without_slow_mo = true,
    is_npc_nav_pulse_shown_without_slow_mo = false,
    does_player_nav_pulse_grow = false,
    does_npc_nav_pulse_grow = true,
    is_player_prediction_shown = true,
    is_npc_prediction_shown = true,
    
    nav_selection_prediction_opacity = 0.5,
    nav_selection_prediction_tween_duration = 0.15,
    new_path_pulse_duration = 0.7,
    new_path_pulse_time_length = 1.0,
}

var _movement_manifest := {
    uses_point_and_click_navigation = true,
    cancels_point_and_click_nav_on_key_press = true,
    
    gravity_default = 5000.0,
    gravity_slow_rise_multiplier_default = 0.38,
    gravity_double_jump_slow_rise_multiplier_default = 0.68,
    walk_acceleration_default = 8000.0,
    in_air_horizontal_acceleration_default = 2500.0,
    climb_up_speed_default = -230.0,
    climb_down_speed_default = 120.0,
    friction_coefficient_default = 1.25,
    jump_boost_default = -900.0,
    wall_jump_horizontal_boost_default = 200.0,
    wall_fall_horizontal_boost_default = 20.0,
    
    max_horizontal_speed_default_default = 320.0,
    max_vertical_speed_default = 2800.0,
    min_horizontal_speed = 5.0,
    min_vertical_speed = 0.0,
    
    dash_speed_multiplier_default = 3.0,
    dash_vertical_boost_default = -300.0,
    dash_duration_default = 0.3,
    dash_fade_duration_default = 0.1,
    dash_cooldown_default = 1.0,
    
    additional_edge_weight_offset_default = 128.0,
    walking_edge_weight_multiplier_default = 1.2,
    climbing_edge_weight_multiplier_default = 1.8,
    air_edge_weight_multiplier_default = 1.0,
    
    action_handler_classes = \
            SurfacerMovementManifest.DEFAULT_ACTION_HANDLER_CLASSES,
    edge_calculator_classes = \
            SurfacerMovementManifest.DEFAULT_EDGE_CALCULATOR_CLASSES,
}

var _surfacer_manifest := {
    precompute_platform_graph_for_levels = [],
    ignores_platform_graph_save_files = false,
    ignores_platform_graph_save_file_trajectory_state = false,
    is_debug_only_platform_graph_state_included = false,
    are_loaded_surfaces_deeply_validated = true,
    uses_threads_for_platform_graph_calculation = false and _uses_threads,
    
    behaviors = Su.DEFAULT_BEHAVIOR_CLASSES,
    default_tile_set = \
            preload("res://src/levels/momma_duck_surfaces_tile_set.tres"),
    path_drag_update_throttle_interval = 0.2,
    path_beat_update_throttle_interval = 0.2,
    
    # Params for CameraPanController.
    snaps_camera_back_to_character = true,
    max_zoom_multiplier_from_pointer = 1.5,
    max_pan_distance_from_pointer = 512.0,
    duration_to_max_pan_from_pointer_at_max_control = 0.67,
    duration_to_max_zoom_from_pointer_at_max_control = 3.0,
    screen_size_ratio_distance_from_edge_to_start_pan_from_pointer = 0.16,
    
    skip_choreography_framerate_multiplier = 4.0,
    
    debug_params = _surfacer_debug_params,
    
    movement_manifest = _movement_manifest,
    annotations_manifest = _annotations_manifest,
}

var app_manifest := {
    metadata = _metadata,
    audio_manifest = _audio_manifest,
    colors_manifest = _colors_manifest,
    styles_manifest = _default_styles_manifest_normal,
    images_manifest = _default_images_manifest_normal,
    gui_manifest = _gui_manifest,
    slow_motion_manifest = _slow_motion_manifest,
    input_map = _input_map,
    character_manifest = _character_manifest,
    surfacer_manifest = _surfacer_manifest,
    
    level_config_class = MommaDuckLevelConfig,
    level_session_class = MommaDuckLevelSession,
    annotators_class = SurfacerAnnotators,
}

var _overrides := {
    images_manifest = _images_overrides,
}

var includes_leash := true

# ---


func _ready() -> void:
    Sc.call_deferred("run", app_manifest)


func _override_configs_for_app() -> void:
    if _is_using_pixel_style:
        app_manifest.gui_manifest.fonts_manifest = \
                _default_fonts_manifest_pixel
        app_manifest.styles_manifest = _styles_manifest_pixel
        app_manifest.images_manifest = _default_images_manifest_pixel
    else:
        app_manifest.gui_manifest.fonts_manifest = \
                _default_fonts_manifest_normal
        app_manifest.styles_manifest = _default_styles_manifest_normal
        app_manifest.images_manifest = _default_images_manifest_normal
    
    _override_manifest(app_manifest, _overrides)


#func _instantiate_sub_modules() -> void:
#    pass


func _configure_sub_modules() -> void:
    Sc.profiler.preregister_metric_keys(_additional_metric_keys)


func _load_state() -> void:
    MommaDuck.includes_leash = Sc.save_state.get_setting(
            INCLUDES_LEASH_SETTINGS_KEY,
            false)
