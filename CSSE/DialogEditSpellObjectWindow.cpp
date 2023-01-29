#include "DialogEditSpellObjectWindow.h"

#include "LogUtil.h"
#include "MemoryUtil.h"

namespace se::cs::dialog::edit_spell_object_window {

	//
	// Configuration
	//

	constexpr auto ENABLE_ALL_OPTIMIZATIONS = true;
	constexpr auto LOG_PERFORMANCE_RESULTS = false;

	//
	// Extended window messages.
	//

	std::optional<LRESULT> messageResult;

	std::chrono::high_resolution_clock::time_point initializationTimer;

	void PatchDialogProc_BeforeInitialize(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		if constexpr (LOG_PERFORMANCE_RESULTS) {
			initializationTimer = std::chrono::high_resolution_clock::now();
		}

		// Optimize redraws.
		if constexpr (ENABLE_ALL_OPTIMIZATIONS) {
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT1_EFFECT_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT1_EFFECT_VAR_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT1_RANGE_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT2_EFFECT_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT2_EFFECT_VAR_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT2_RANGE_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT3_EFFECT_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT3_EFFECT_VAR_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT3_RANGE_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT4_EFFECT_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT4_EFFECT_VAR_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT4_RANGE_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT5_EFFECT_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT5_EFFECT_VAR_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT5_RANGE_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT6_EFFECT_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT6_EFFECT_VAR_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT6_RANGE_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT7_EFFECT_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT7_EFFECT_VAR_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT7_RANGE_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT8_EFFECT_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT8_EFFECT_VAR_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT8_RANGE_COMBO, WM_SETREDRAW, FALSE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_TYPE_COMBO, WM_SETREDRAW, FALSE, NULL);
		}
	}

	void PatchDialogProc_AfterInitialize(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		// Restore redraws.
		if constexpr (ENABLE_ALL_OPTIMIZATIONS) {
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT1_EFFECT_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT1_EFFECT_VAR_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT1_RANGE_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT2_EFFECT_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT2_EFFECT_VAR_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT2_RANGE_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT3_EFFECT_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT3_EFFECT_VAR_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT3_RANGE_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT4_EFFECT_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT4_EFFECT_VAR_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT4_RANGE_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT5_EFFECT_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT5_EFFECT_VAR_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT5_RANGE_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT6_EFFECT_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT6_EFFECT_VAR_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT6_RANGE_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT7_EFFECT_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT7_EFFECT_VAR_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT7_RANGE_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT8_EFFECT_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT8_EFFECT_VAR_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_EFFECT8_RANGE_COMBO, WM_SETREDRAW, TRUE, NULL);
			SendDlgItemMessageA(hWnd, CONTROL_ID_TYPE_COMBO, WM_SETREDRAW, TRUE, NULL);
		}

		if constexpr (LOG_PERFORMANCE_RESULTS) {
			auto timeToInitialize = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::high_resolution_clock::now() - initializationTimer);
			log::stream << "Displaying spell object data took " << timeToInitialize.count() << "ms" << std::endl;
		}
	}

	LRESULT CALLBACK PatchDialogProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
		messageResult = {};

		switch (msg) {
		case WM_INITDIALOG:
			PatchDialogProc_BeforeInitialize(hWnd, msg, wParam, lParam);
			break;
		}

		if (messageResult) {
			return messageResult.value();
		}

		// Call original function.
		const auto CS_VanillaDialogProc = reinterpret_cast<WNDPROC>(0x432AE0);
		const auto vanillaResult = CS_VanillaDialogProc(hWnd, msg, wParam, lParam);

		switch (msg) {
		case WM_INITDIALOG:
			PatchDialogProc_AfterInitialize(hWnd, msg, wParam, lParam);
			break;
		}

		return messageResult.value_or(vanillaResult);
	}

	//
	//
	//

	void installPatches() {
		using memory::genJumpEnforced;

		// Patch: Extend handling.
		genJumpEnforced(0x401299, 0x432AE0, reinterpret_cast<DWORD>(PatchDialogProc));
	}
}
