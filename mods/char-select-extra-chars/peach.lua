if not _G.charSelectExists then return end

E_MODEL_PEACH_PLAYER = smlua_model_util_get_id("peach_player_geo")

local TEX_PEACH = get_texture_info("peach_player_icon")

ACT_PEACH_FLOAT = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_FLAG_MOVING)

VOICETABLE_PEACH = {
    [CHAR_SOUND_ATTACKED] = "peach_attacked.ogg",
    [CHAR_SOUND_COUGHING1] = "peach_coughing1.ogg",
    [CHAR_SOUND_COUGHING2] = "peach_coughing2.ogg",
    [CHAR_SOUND_COUGHING3] = "peach_coughing3.ogg",
    [CHAR_SOUND_DOH] = "peach_doh.ogg",
    [CHAR_SOUND_DROWNING] = "peach_drowning.ogg",
    [CHAR_SOUND_DYING] = "peach_dying.ogg",
    [CHAR_SOUND_EEUH] = "peach_euuh.ogg",
    [CHAR_SOUND_GROUND_POUND_WAH] = "peach_ground_pound_wah.ogg",
    [CHAR_SOUND_HAHA] = "peach_haha.ogg",
    [CHAR_SOUND_HAHA_2] = "peach_haha.ogg",
    [CHAR_SOUND_HERE_WE_GO] = "peach_herewego.ogg",
    [CHAR_SOUND_HOOHOO] = "peach_hoohoo.ogg",
    [CHAR_SOUND_HRMM] = "peach_hrmm.ogg",
    [CHAR_SOUND_IMA_TIRED] = "peach_imatired.ogg",
    [CHAR_SOUND_MAMA_MIA] = "peach_mamamia.ogg",
    [CHAR_SOUND_LETS_A_GO] = "peach_letsago.ogg",
    [CHAR_SOUND_ON_FIRE] = "peach_on_fire.ogg",
    [CHAR_SOUND_OOOF] = "peach_ooof.ogg",
    [CHAR_SOUND_OOOF2] = "peach_ooof2.ogg",
    [CHAR_SOUND_PANTING] = "peach_panting.ogg",
    [CHAR_SOUND_PANTING_COLD] = "peach_panting_cold.ogg",
    [CHAR_SOUND_PUNCH_HOO] = "peach_punch_hoo.ogg",
    [CHAR_SOUND_PUNCH_WAH] = "peach_punch_wah.ogg",
    [CHAR_SOUND_PUNCH_YAH] = "peach_punch_yah.ogg",
    [CHAR_SOUND_SO_LONGA_BOWSER] = "peach_solonga_bowser.ogg",
    [CHAR_SOUND_SNORING1] = "peach_snoring1.ogg",
    [CHAR_SOUND_SNORING2] = "peach_snoring2.ogg",
    [CHAR_SOUND_SNORING3] = {"peach_snoring2.ogg", "peach_snoring1.ogg", "peach_snoring3.ogg"},
    [CHAR_SOUND_TWIRL_BOUNCE] = "peach_twirl_bounce.ogg",
    [CHAR_SOUND_UH] = "peach_uh.ogg",
    [CHAR_SOUND_UH2] = "peach_uh2.ogg",
    [CHAR_SOUND_UH2_2] = "peach_uh2_2.ogg",
    [CHAR_SOUND_WAAAOOOW] = "peach_waaaooow.ogg",
    [CHAR_SOUND_WAH2] = "peach_ground_pound_wah.ogg",
    [CHAR_SOUND_WHOA] = "peach_whoa.ogg",
    [CHAR_SOUND_YAHOO] = "peach_yahoo.ogg",
    [CHAR_SOUND_YAWNING] = "peach_yawning.ogg",
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = { "peach_yahoo.ogg", "peach_yahoo1.ogg", "peach_yahoo2.ogg", "peach_yahoo3.ogg", "peach_yahoo4.ogg", "peach_yahoo5.ogg" },
    [CHAR_SOUND_YAH_WAH_HOO] = { "peach_yah_wah_hoo1.ogg", "peach_yah_wah_hoo2.ogg", "peach_yah_wha_hoo3.ogg"},
    [CHAR_SOUND_HELLO] = "peach_float.ogg"
}

-- CAPS (Will be worked on in the future)
-- local capPEACH = {
    -- normal = smlua_model_util_get_id("peachs_cap_geo"),
    -- wing = smlua_model_util_get_id("peachs_wing_cap_geo"),
    -- metal = smlua_model_util_get_id("peachs_metal_cap_geo"),
    -- metalWing = smlua_model_util_get_id("peachs_metal_wing_cap_geo")
-- }

ANIMTABLE_PEACH = {
    [CHAR_ANIM_RUNNING] = "peach_running",
    [CHAR_ANIM_IDLE_HEAD_CENTER] = "peach_idle_head_center",
    [CHAR_ANIM_IDLE_HEAD_LEFT] = "peach_idle_head_left",
    [CHAR_ANIM_IDLE_HEAD_RIGHT] = "peach_idle_head_right",
    [CHAR_ANIM_BACKWARD_KB] = "peach_backward_kb",
    [CHAR_ANIM_FIRST_PERSON] = "peach_first_person",
    [CHAR_ANIM_FLUTTERKICK] = "peach_flutterkick",
    [CHAR_ANIM_FLUTTERKICK_WITH_OBJ] = "peach_flutterkick_with_obj",
    [CHAR_ANIM_FORWARD_KB] = "peach_forward_kb",
    [CHAR_ANIM_GROUND_BONK] = "peach_ground_bonk",
    [CHAR_ANIM_GROUND_KICK] = "peach_ground_kick",
    [CHAR_ANIM_GROUND_THROW] = "peach_ground_throw",
    [CHAR_ANIM_HEAVY_THROW] = "peach_heavy_throw",
    [CHAR_ANIM_MISSING_CAP] = "peach_missing_cap",
    [CHAR_ANIM_PULL_DOOR_WALK_IN] = "peach_pull_door_walk_in",
    [CHAR_ANIM_FIRST_PERSON] = "peach_first_person",
    [CHAR_ANIM_RELEASE_BOWSER] = "peach_release_bowser",
    [CHAR_ANIM_RETURN_FROM_STAR_DANCE] = "peach_return_from_star_dance",
    [CHAR_ANIM_RETURN_STAR_APPROACH_DOOR] = "peach_return_star_approach_door",
    [CHAR_ANIM_SLIDEFLIP_LAND] = "peach_sideflip_land",
    [CHAR_ANIM_SLEEP_IDLE] = "peach_sleep_idle",
    [CHAR_ANIM_START_SLEEP_SITTING] = "peach_sleep_sitting",
    [CHAR_ANIM_SOFT_BACK_KB] = "peach_soft_back_kb",
    [CHAR_ANIM_SOFT_FRONT_KB] = "peach_soft_front_kb",
    [CHAR_ANIM_STAR_DANCE] = "peach_star_dance",
    [CHAR_ANIM_START_CROUCHING] = "peach_start_crouch",
    [CHAR_ANIM_STOP_CROUCHING] = "peach_stop_crouch",
    [CHAR_ANIM_START_SLEEP_IDLE] = "peach_start_sleep",
    [CHAR_ANIM_STOP_SLIDE] = "peach_stop_slide",
    [CHAR_ANIM_SUMMON_STAR] = "peach_summon_star",
    [CHAR_ANIM_SWIM_WITH_OBJ_PART1] = "peach_swim_with_obj1",
    [CHAR_ANIM_SWIM_WITH_OBJ_PART2] = "peach_swim_with_obj2",
    [CHAR_ANIM_TRIPLE_JUMP_LAND] = "peach_triple_jump_land",
    [CHAR_ANIM_TURNING_PART1] = "peach_turning_part1",
    [CHAR_ANIM_TURNING_PART2] = "peach_turning_part2",
    [CHAR_ANIM_TWIRL_LAND] = "peach_twirl_land",
    [CHAR_ANIM_WAKE_FROM_LYING] = "peach_wake_from_lying",
    [CHAR_ANIM_WAKE_FROM_SLEEP] = "peach_wake_from_sleep",
    [CHAR_ANIM_CREDITS_RAISE_HAND] = "peach_credits_raise_hand",
    [CHAR_ANIM_CREDITS_RETURN_FROM_LOOK_UP] = "peach_credits_return_from_look_up",
    [CHAR_ANIM_CREDITS_START_WALK_LOOK_UP] = "peach_credits_start_walk_look_up",
    [CHAR_ANIM_CREDITS_TAKE_OFF_CAP] = "peach_credits_take_off_cap",
    [CHAR_ANIM_DYING_FALL_OVER] = "peach_dying_fall_over",
    [CHAR_ANIM_FALL_OVER_BACKWARDS] = "peach_fall_over_backwards",
    [CHAR_ANIM_FAST_LEDGE_GRAB] = "peach_fast_ledge_grab",
    -- [CHAR_ANIM_FINAL_BOWSER_RAISE_HAND_SPIN] = "peach_final_bowser_raise_hand_spin",
    [CHAR_ANIM_FIRST_PUNCH_FAST] = "peach_first_punch_fast",
    [CHAR_ANIM_GENERAL_LAND] = "peach_general_land",
    [CHAR_ANIM_HEAD_STUCK_IN_GROUND] = "peach_head_stuck_in_ground",
    [CHAR_ANIM_LAND_FROM_DOUBLE_JUMP] = "peach_land_from_double_jump",
    [CHAR_ANIM_LAND_FROM_SINGLE_JUMP] = "peach_land_from_single_jump",
    [CHAR_ANIM_LAND_ON_STOMACH] = "peach_land_on_stomach",
    [CHAR_ANIM_LEGS_STUCK_IN_GROUND] = "peach_legs_stuck_in_ground",
    [CHAR_ANIM_PLACE_LIGHT_OBJ] = "peach_place_light_obj",
    [CHAR_ANIM_PUSH_DOOR_WALK_IN] = "peach_push_door_walk_in",
    [CHAR_ANIM_PUT_CAP_ON] = "peach_put_cap_on",
    [CHAR_ANIM_RUN_WITH_LIGHT_OBJ] = "peach_run_with_light_obj",
    [CHAR_ANIM_SECOND_PUNCH_FAST] = "peach_second_punch_fast",
    [CHAR_ANIM_SHIVERING_RETURN_TO_IDLE] = "peach_shivering_returning_to_idle",
    [CHAR_ANIM_SKID_ON_GROUND] = "peach_skid_on_ground",
    [CHAR_ANIM_SLOW_LAND_FROM_DIVE] = "peach_slow_land_from_dive",
    [CHAR_ANIM_SLOW_LEDGE_GRAB] = "peach_slow_ledge_grab",
    [CHAR_ANIM_SLOW_WALK_WITH_LIGHT_OBJ] = "peach_slow_walk_with_light_obj",
    [CHAR_ANIM_STAND_UP_FROM_LAVA_BOOST] = "peach_stand_up_from_lava_boost",
    [CHAR_ANIM_STOP_SKID] = "peach_stop_skid",
    [CHAR_ANIM_TAKE_CAP_OFF_THEN_ON] = "peach_take_cap_off_then_on",
    [CHAR_ANIM_THROW_CATCH_KEY] = "peach_throw_catch_key",
    [CHAR_ANIM_WALK_WITH_LIGHT_OBJ] = "peach_walk_with_light_obj",
    [CHAR_ANIM_BOTTOM_STUCK_IN_GROUND] = "peach_bottom_stuck_in_ground",
    -- [CHAR_ANIM_CREDITS_PEACE_SIGN] = "peach_credits_peace_sign",
    [CHAR_ANIM_FIRE_LAVA_BURN] = "peach_fire_lava_burn",
    [CHAR_ANIM_GROUND_POUND] = "peach_ground_pound",
    [CHAR_ANIM_GROUND_POUND_LANDING] = "peach_ground_pound_landing",
    [CHAR_ANIM_TRIPLE_JUMP_GROUND_POUND] = "peach_triple_jump_ground_pound_anim",
    [CHAR_ANIM_UNLOCK_DOOR] = "peach_unlock_door",
    [CHAR_ANIM_SWINGING_BOWSER] = "peach_swinging_bowser",
    [CHAR_ANIM_HOLDING_BOWSER] = "peach_holding_bowser",
    [CHAR_ANIM_GRAB_BOWSER] = "peach_grab_bowser",
    [CHAR_ANIM_BEND_KNESS_RIDING_SHELL] = "peach_dressfloating"
}

local PALETTE_PEACH = {
    [PANTS]  = { r = 0xFF, g = 0x50, b = 0x96 },
    [SHIRT]  = { r = 0xF8, g = 0xC8, b = 0xBB },
    [GLOVES] = { r = 0xFF, g = 0xFF, b = 0xFF },
    [SHOES]  = { r = 0x00, g = 0x00, b = 0xFF },
    [HAIR]   = { r = 0xFF, g = 0xD3, b = 0x02 },
    [SKIN]   = { r = 0xFE, g = 0xC1, b = 0x79 },
    [CAP]    = { r = 0xFF, g = 0xFF, b = 0x00 },
    [EMBLEM] = { r = 0x00, g = 0x82, b = 0xFF }
}

CT_PEACH = _G.charSelect.character_add("Princess Peach", "The ruler of the Mushroom Kingdom, always ready to help Mario in his adventures and save her kingdom from the evil clutches of King Bowser! Voiced by SuperKirbyLover", "Melzinoff & SuperKirbyLover", {r = 239, g = 128, b = 177}, E_MODEL_PEACH_PLAYER, CT_MARIO, TEX_PEACH)
-- _G.charSelect.character_add_caps(E_MODEL_PEACH, capPEACH)
_G.charSelect.character_add_voice(E_MODEL_PEACH_PLAYER, VOICETABLE_PEACH)
_G.charSelect.character_add_palette_preset(E_MODEL_PEACH_PLAYER, PALETTE_PEACH)

--- @param m MarioState
local function act_peach_float(m)
    -- apply movement when using action
    common_air_action_step(m, ACT_JUMP_LAND, CHAR_ANIM_BEND_KNESS_RIDING_SHELL, AIR_STEP_NONE)

    -- setup when action starts (horizontal speed and voiceline)
    if m.actionTimer == 0 then
        if m.forwardVel > 20 then
            mario_set_forward_vel(m, 20)
        end
        play_character_sound(m, CHAR_SOUND_HELLO)
    end

    -- block all y movement when using the move
    m.vel.y = 0
    set_mario_particle_flags(m, PARTICLE_SPARKLES, 0)

    -- avoid issue with flying and then make the hover end after 2 secs or when stopping holding the button
    if m.prevAction ~= ACT_TRIPLE_JUMP and (m.flags & MARIO_WING_CAP) ~= 0 then
        if m.actionTimer >= 50 or (m.controller.buttonDown & A_BUTTON) == 0 then
            set_mario_action(m, ACT_FREEFALL, 0)
        end
    else
        if m.actionTimer >= 50 or (m.controller.buttonDown & A_BUTTON) == 0 then
            set_mario_action(m, ACT_FREEFALL, 0)
        end
    end

    -- increment the action timer to make the hover stop
    m.actionTimer = m.actionTimer + 1
end

--- @param m MarioState
function peach_update(m)
    -- patch in custom animations
    local anim = ANIMTABLE_PEACH[m.marioObj.header.gfx.animInfo.animID]
    if anim ~= nil then
        smlua_anim_util_set_animation(m.marioObj, anim)
    end

    if (m.input & INPUT_A_PRESSED) ~= 0 and m.vel.y < -15 and (
       m.action == ACT_JUMP or
       m.action == ACT_DOUBLE_JUMP or
       m.action == ACT_TRIPLE_JUMP or
       m.action == ACT_LONG_JUMP or
       m.action == ACT_BACKFLIP or
       m.action == ACT_SIDE_FLIP or
       m.action == ACT_WALL_KICK_AIR) then
        set_mario_action(m, ACT_PEACH_FLOAT, 0)
    end
end

hook_mario_action(ACT_PEACH_FLOAT, act_peach_float)