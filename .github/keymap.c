const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [0] = LAYOUT_split_3x6_3_ex2(
        KC_TAB,  KC_Q, KC_W, KC_E, KC_R, KC_T, KC_HOME,
        KC_LCTL, KC_A, KC_S, KC_D, KC_F, KC_G, KC_END,
        KC_LSFT, KC_Z, KC_X, KC_C, KC_V, KC_B,

        KC_PGUP, KC_Y, KC_U, KC_I,    KC_O,   KC_P,    KC_BSPC,
        KC_PGDN, KC_H, KC_J, KC_K,    KC_L,   KC_SCLN, KC_QUOT,
                 KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_GRV,

        KC_LALT, MO(1), KC_SPC, KC_ENT, MO(2), KC_LGUI,
    ),

    [1] = LAYOUT_SPLIT_3x6_3(
        KC_ESC,  KC_1,    KC_2,   KC_3,    KC_4,    KC_5,    XXXXXXX,
        _______, KC_6,    KC_7,   KC_8,    KC_9,    KC_0,    XXXXXXX,
        _______, KC_MINS, KC_EQL, KC_LBRC, KC_RBRC, KC_BSLS,

        XXXXXXX, KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC, KC_DEL,
        XXXXXXX, KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, XXXXXXX,
                 KC_UNDS, KC_PLUS, KC_LCBR, KC_RCBR, KC_PIPE, XXXXXXX,

        _______, XXXXXXX, XXXXXXX, XXXXXXX, KC_ESC, _______,
    ),

    [2] = LAYOUT_SPLIT_3x6_3(
        XXXXXXX, KC_F1,  KC_F2,  KC_F3,   KC_F4,   KC_F5,   KC_BRIU,
        _______, KC_F6,  KC_F7,  KC_F8,   KC_F9,   KC_F10,  KC_BRID,
        _______, KC_F11, KC_F12, BL_DOWN, BL_UP,   BL_TOGG,

        KC_VOLU, KC_MUTE, KC_MPRV, KC_MPLY, KC_MNXT, XXXXXXX, XXXXXXX,
        KC_VOLD, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, XXXXXXX, XXXXXXX,
                 XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,

        _______, KC_ESC, XXXXXXX, XXXXXXX, XXXXXXX, _______,
    ),

    [3] = LAYOUT_SPLIT_3x6_3(
        _______, MI_Cs, MI_Ds, MI_F,  MI_Fs, _______, _______,
        _______, MI_C,  MI_D,  MI_E,  MI_F,  _______, _______,
        _______, MI_B,  MI_Db, MI_Eb, MI_E,  _______,

        _______, _______, MI_Ds, MI_F,  MI_Fs, MI_Gs, MI_As,
        _______, _______, MI_D,  MI_E,  MI_F,  MI_G,  MI_A,
                 _______, MI_Db, MI_Eb, MI_E,  MI_Gb, MI_Ab,

        _______, MI_G, _______, _______, MI_C, _______,
    ),

    [4] = LAYOUT_SPLIT_3x6_3(
        MI_G,  MI_Gs,  MI_A, MI_As, MI_B,  MI_C2, _______,
        MI_D,  MI_Ds,  MI_E, MI_F,  MI_Fs, MI_G,  _______,
        MI_A0, MI_As0, MI_B, MI_C,  MI_Cs, MI_D,

        _______, MI_G2, MI_Gs2, MI_A2, MI_As2, MI_B2,  MI_C3,
        _______, MI_A,  MI_As,  MI_B2, MI_C2,  MI_Cs2, MI_D2,
                 MI_E,  MI_F,   MI_Fs, MI_G,   MI_Gs,  MI_A,

        _______, _______, _______, _______, _______, _______,
    ),

    [_] = LAYOUT_SPLIT_3x6_3(
        _______, _______, _______, _______, _______, _______, _______,
        _______, _______, _______, _______, _______, _______, _______,
        _______, _______, _______, _______, _______, _______,

        _______, _______, _______, _______, _______, _______, _______,
        _______, _______, _______, _______, _______, _______, _______,
                 _______, _______, _______, _______, _______, _______,

        _______, _______, _______, _______, _______, _______,
    ),
};
