#include <stdio.h>
#include "../network.h"
#include "object_fields.h"
#include "object_constants.h"
#include "sm64.h"

void network_send_player(void) {
    if (gMarioStates[0].marioObj == NULL) { return; }
    u32 heldSyncID = (gMarioStates[0].heldObj != NULL)
                   ? gMarioStates[0].heldObj->oSyncID
                   : NULL;
    u32 heldBySyncID = (gMarioStates[0].heldByObj != NULL)
                     ? gMarioStates[0].heldByObj->oSyncID
                      : NULL;

    struct Packet p;
    packet_init(&p, PACKET_PLAYER, false);
    packet_write(&p, &gMarioStates[0], sizeof(u32) * 24);
    packet_write(&p, gMarioStates[0].controller, 20);
    packet_write(&p, gMarioStates[0].marioObj->rawData.asU32, sizeof(u32) * 80);
    packet_write(&p, &gMarioStates[0].health, sizeof(s16));
    packet_write(&p, &gMarioStates[0].marioObj->header.gfx.node.flags, sizeof(s16));
    packet_write(&p, &gMarioStates[0].actionState, sizeof(u16));
    packet_write(&p, &gMarioStates[0].actionTimer, sizeof(u16));
    packet_write(&p, &gMarioStates[0].actionArg, sizeof(u32));
    packet_write(&p, &gMarioStates[0].currentRoom, sizeof(s16));
    packet_write(&p, &gMarioStates[0].squishTimer, sizeof(u8));

    packet_write(&p, &heldSyncID, sizeof(u32));
    packet_write(&p, &heldBySyncID, sizeof(u32));
    network_send(&p);
}

void network_receive_player(struct Packet* p) {
    if (gMarioStates[1].marioObj == NULL) { return; }
    int oldActionState = gMarioStates[1].actionState;
    u32 heldSyncID = NULL;
    u32 heldBySyncID = NULL;

    u16 playerIndex = gMarioStates[1].playerIndex;
    u32 oldAction = gMarioStates[1].action;
    packet_read(p, &gMarioStates[1], sizeof(u32) * 24);
    packet_read(p, gMarioStates[1].controller, 20);
    packet_read(p, &gMarioStates[1].marioObj->rawData.asU32, sizeof(u32) * 80);
    packet_read(p, &gMarioStates[1].health, sizeof(s16));
    packet_read(p, &gMarioStates[1].marioObj->header.gfx.node.flags, sizeof(s16));
    packet_read(p, &gMarioStates[1].actionState, sizeof(u16));
    packet_read(p, &gMarioStates[1].actionTimer, sizeof(u16));
    packet_read(p, &gMarioStates[1].actionArg, sizeof(u32));
    packet_read(p, &gMarioStates[1].currentRoom, sizeof(s16));
    packet_read(p, &gMarioStates[1].squishTimer, sizeof(u8));

    packet_read(p, &heldSyncID, sizeof(u32));
    packet_read(p, &heldBySyncID, sizeof(u32));
    gMarioStates[1].playerIndex = playerIndex;
    if (gMarioStates[1].action != oldAction) {
        gMarioStates[1].flags &= ~(MARIO_ACTION_SOUND_PLAYED | MARIO_MARIO_SOUND_PLAYED);
    }

    if (heldSyncID != NULL && syncObjects[heldSyncID].o != NULL) {
        // TODO: do we have to move graphics nodes around to make this visible?
        struct Object* heldObj = syncObjects[heldSyncID].o;
        gMarioStates[1].heldObj = heldObj;
        heldObj->oHeldState = HELD_HELD;
        heldObj->heldByPlayerIndex = 1;
    } else {
        gMarioStates[1].heldObj = NULL;
    }

    if (heldBySyncID != NULL && syncObjects[heldBySyncID].o != NULL) {
        // TODO: do we have to move graphics nodes around to make this visible?
        gMarioStates[1].heldByObj = syncObjects[heldBySyncID].o;
    } else {
        gMarioStates[1].heldByObj = NULL;
    }

    // restore action state, needed for jump kicking
    gMarioStates[1].actionState = oldActionState;
}

void network_update_player(void) {
    network_send_player();
}
