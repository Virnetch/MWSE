#include "VMExecuteInterface.h"
#include "Stack.h"
#include "InstructionInterface.h"
#include "TES3Util.h"
#include "TES3MobileNPC.h"
#include "TES3Skill.h"
#include "TES3Reference.h"

namespace mwse {
	class xGetBaseRestoration : InstructionInterface_t {
	public:
		xGetBaseRestoration();
		virtual float execute(VMExecuteInterface& virtualMachine);
	private:
		const float INVALID_VALUE = -1.0f;
	};

	static xGetBaseRestoration xGetBaseRestorationInstance;

	xGetBaseRestoration::xGetBaseRestoration() : mwse::InstructionInterface_t(OpCode::xGetBaseRestoration) {}

	float xGetBaseRestoration::execute(mwse::VMExecuteInterface& virtualMachine) {
		// Get the associated MACP record.
		TES3::Reference* reference = virtualMachine.getReference();
		if (reference == nullptr) {
			if constexpr (DEBUG_MWSCRIPT_FUNCTIONS) {
				mwse::log::getLog() << "xGetBaseRestoration: No reference provided." << std::endl;
			}
			mwse::Stack::getInstance().pushFloat(INVALID_VALUE);
			return 0.0f;
		}

		auto mobileObject = reference->getAttachedMobileNPC();
		if (mobileObject == NULL) {
			if constexpr (DEBUG_MWSCRIPT_FUNCTIONS) {
				mwse::log::getLog() << "xGetBaseRestoration: Could not find MACP record for reference." << std::endl;
			}
			mwse::Stack::getInstance().pushFloat(INVALID_VALUE);
			return 0.0f;
		}

		// Push the base value of that skill.
		mwse::Stack::getInstance().pushFloat(mobileObject->skills[TES3::SkillID::Restoration].base);

		return 0.0f;
	}
}
