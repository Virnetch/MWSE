#pragma once

#include "TES3Defines.h"

#include "TES3Vectors.h"

namespace TES3 {
	enum AttackAnimationState : signed char {
		Idle = 0x0,
		Ready = 0x1,
		SwingUp = 0x2,
		SwingDown = 0x3,
		SwingHit = 0x4,
		SwingFollowLight = 0x5,
		SwingFollowMed = 0x6,
		SwingFollowHeavy = 0x7,
		ReadyingWeap = 0x8,
		UnreadyWeap = 0x9,
		Casting = 0xA,
		Casting2 = 0xB,
		ReadyingMagic = 0xC,
		UnreadyMagic = 0xD,
		Knockdown = 0xE,
		KnockedOut = 0xF,
		PickingProbing = 0x10,
		Unknown_0x11 = 0x11,
		Dying = 0x12,
		Dead = 0x13,
	};

	struct ActionData {
		short unknown_0x0;
		short unknown_0x2;
		float attackSwing; // 0x4
		float swingTimer; // 0x8
		float physicalDamage; // 0xC
		signed char aiBehaviourState; // 0x10
		AttackAnimationState animStateAttack; // 0x11
		char unknown_0x12;
		char unknown_0x13;
		signed char attackDirection; // 0x14
		char unknown_0x15;
		signed char currentAnimGroup; // 0x16
		char unknown_0x17;
		short unknown_0x18;
		short unknown_0x1A;
		short unknown_0x1C;
		short unknown_0x1E;
		MobileActor * target; // 0x20
		MobileActor * hitTarget; // 0x24
		short lastBarterHoursPassed; // 0x28
		short unknown_0x2A;
		BaseObject * stolenFromFactionOrNPC; // 0x2C
		char unknown_0x30;
		char unknown_0x31; // Undefined.
		char unknown_0x32; // Undefined.
		char unknown_0x33; // Undefined.
		Item * nockedProjectile;
		short unknown_0x38;
		Vector3 unknown_0x3C;
		int unknown_0x48;
		int unknown_0x4C;
		int unknown_0x50;
		Vector3 unknown_0x54;
		Vector3 walkDestination; // 0x58
		int unknown_0x6C;

	};
	static_assert(sizeof(ActionData) == 0x70, "TES3::ActionData failed size validation");
}
