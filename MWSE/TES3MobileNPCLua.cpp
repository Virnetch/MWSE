#include "TES3MobileNPCLua.h"

#include "sol.hpp"
#include "LuaManager.h"
#include "LuaUtil.h"

#include "TES3MobileNPC.h"
#include "TES3NPC.h"
#include "TES3Skill.h"

namespace mwse {
	namespace lua {
		void bindTES3MobileNPC() {
			// Get our lua state.
			sol::state& state = LuaManager::getInstance().getState();

			// Start our usertype. We must finish this with state.set_usertype.
			auto usertypeDefinition = state.create_simple_usertype<TES3::MobileNPC>();
			usertypeDefinition.set("new", sol::no_constructor);

			// Define inheritance structures. These must be defined in order from top to bottom. The complete chain must be defined.
			usertypeDefinition.set(sol::base_classes, sol::bases<TES3::MobileActor, TES3::MobileObject>());

			// Basic property binding.
			usertypeDefinition.set("forceJump", &TES3::MobileNPC::flagForceJump);
			usertypeDefinition.set("forceMoveJump", &TES3::MobileNPC::flagForceMoveJump);
			usertypeDefinition.set("forceRun", &TES3::MobileNPC::flagForceRun);
			usertypeDefinition.set("forceSneak", &TES3::MobileNPC::flagForceSneak);

			// Indirect bindings to unions and arrays.
			usertypeDefinition.set("skills", sol::property([](TES3::MobileNPC& self) { return std::ref(self.skills); }));

			// Access to other objects that need to be packaged.
			usertypeDefinition.set("object", sol::readonly_property([](TES3::MobileNPC& self) { return makeLuaObject(self.npcInstance); }));

			// Friendly access to skills.
			usertypeDefinition.set("acrobatics", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Acrobatics]; }));
			usertypeDefinition.set("alchemy", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Alchemy]; }));
			usertypeDefinition.set("alteration", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Alteration]; }));
			usertypeDefinition.set("armorer", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Armorer]; }));
			usertypeDefinition.set("athletics", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Athletics]; }));
			usertypeDefinition.set("axe", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Axe]; }));
			usertypeDefinition.set("block", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Block]; }));
			usertypeDefinition.set("bluntWeapon", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::BluntWeapon]; }));
			usertypeDefinition.set("conjuration", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Conjuration]; }));
			usertypeDefinition.set("destruction", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Destruction]; }));
			usertypeDefinition.set("enchant", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Enchant]; }));
			usertypeDefinition.set("handToHand", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::HandToHand]; }));
			usertypeDefinition.set("heavyArmor", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::HeavyArmor]; }));
			usertypeDefinition.set("illusion", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Illusion]; }));
			usertypeDefinition.set("lightArmor", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::LightArmor]; }));
			usertypeDefinition.set("longBlade", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::LongBlade]; }));
			usertypeDefinition.set("marksman", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Marksman]; }));
			usertypeDefinition.set("mediumArmor", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::MediumArmor]; }));
			usertypeDefinition.set("mercantile", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Mercantile]; }));
			usertypeDefinition.set("mysticism", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Mysticism]; }));
			usertypeDefinition.set("restoration", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Restoration]; }));
			usertypeDefinition.set("security", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Security]; }));
			usertypeDefinition.set("shortBlade", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::ShortBlade]; }));
			usertypeDefinition.set("sneak", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Sneak]; }));
			usertypeDefinition.set("spear", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Spear]; }));
			usertypeDefinition.set("speechcraft", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Speechcraft]; }));
			usertypeDefinition.set("unarmored", sol::readonly_property([](TES3::MobileNPC& self) { return &self.skills[TES3::SkillID::Unarmored]; }));

			// Finish up our usertype.
			state.set_usertype("tes3mobileNPC", usertypeDefinition);
		}
	}
}
