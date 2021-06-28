#include "djui.h"
#include "src/pc/utils/misc.h"
#include "src/pc/configfile.h"

static void djui_panel_display_apply(struct DjuiBase* caller) {
    configWindow.settings_changed = true;
}

void djui_panel_display_create(struct DjuiBase* caller) {
    f32 bodyHeight = 32 * 5 + 64 * 1 + 16 * 4;

    struct DjuiBase* defaultBase = NULL;
    struct DjuiThreePanel* panel = djui_panel_menu_create(bodyHeight, "\\#ff0800\\D\\#1be700\\I\\#00b3ff\\S\\#ffef00\\P\\#ff0800\\L\\#1be700\\A\\#00b3ff\\Y");
    struct DjuiFlowLayout* body = (struct DjuiFlowLayout*)djui_three_panel_get_body(panel);

    {
        struct DjuiCheckbox* checkbox1 = djui_checkbox_create(&body->base, "Fullscreen", &configWindow.fullscreen);
        djui_base_set_size_type(&checkbox1->base, DJUI_SVT_RELATIVE, DJUI_SVT_ABSOLUTE);
        djui_base_set_size(&checkbox1->base, 1.0f, 32);
        djui_interactable_hook_value_change(&checkbox1->base, djui_panel_display_apply);
        defaultBase = &checkbox1->base;

        struct DjuiCheckbox* checkbox2 = djui_checkbox_create(&body->base, "VSync", &configWindow.vsync);
        djui_base_set_size_type(&checkbox2->base, DJUI_SVT_RELATIVE, DJUI_SVT_ABSOLUTE);
        djui_base_set_size(&checkbox2->base, 1.0f, 32);
        djui_interactable_hook_value_change(&checkbox2->base, djui_panel_display_apply);

        struct DjuiCheckbox* checkbox4 = djui_checkbox_create(&body->base, "HUD", &configHUD);
        djui_base_set_size_type(&checkbox4->base, DJUI_SVT_RELATIVE, DJUI_SVT_ABSOLUTE);
        djui_base_set_size(&checkbox4->base, 1.0f, 32);

        char* choices[3] = { "Nearest", "Linear", "Tripoint" };
        struct DjuiSelectionbox* selectionbox1 = djui_selectionbox_create(&body->base, "Filtering", choices, 3, &configFiltering);
        djui_base_set_size_type(&selectionbox1->base, DJUI_SVT_RELATIVE, DJUI_SVT_ABSOLUTE);
        djui_base_set_size(&selectionbox1->base, 1.0f, 32);

        struct DjuiButton* button6 = djui_button_create(&body->base, "Back");
        djui_base_set_size_type(&button6->base, DJUI_SVT_RELATIVE, DJUI_SVT_ABSOLUTE);
        djui_base_set_size(&button6->base, 1.0f, 64);
        djui_interactable_hook_click(&button6->base, djui_panel_menu_back);
    }

    djui_panel_add(caller, &panel->base, defaultBase);
}
