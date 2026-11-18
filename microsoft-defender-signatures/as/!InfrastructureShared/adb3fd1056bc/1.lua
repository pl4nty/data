-- Threat: !InfrastructureShared
-- Name: adb3fd1056bc
-- Type: 21
-- Includes: BMLuaLib

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = bm.get_current_process_startup_info()
if r0_0 and next(r0_0) then
  local r0_1 = string.lower(r0_0.command_line or "")
  local r0_2, r0_3 = "", ""
  local r0_4 = mp.GetParentProcInfo()
  if r0_4 and r0_4.image_path then
    r0_2 = string.lower(r0_4.image_path)
  end
  if r0_4 and r0_4.ppid then
    r0_3 = string.lower(mp.GetProcessCommandLine(r0_4.ppid) or "")
  end
  local r0_5 = contains(r0_1, "--headless")
    or contains(r0_2, "\\conhost.exe") and contains(r0_3, "--headless")
  if r0_5 then
    if contains(r0_2, { "agentexecutor.exe", "\\code.exe", "windowsterminal.exe" }) then
      return mp.CLEAN
    end
    bm.add_related_string("[->] AMSI-FAIL HEADLESS PWSH: ", r0_1, bm.RelatedStringBMReport)
    bm_AddRelatedFileFromCommandLine(r0_1, nil, nil, 1)
    if r0_0.ppid then
      bm.request_SMS(r0_0.ppid, "h+")
      bm.add_action("SmsAsyncScanEvent", 1)
    end
    triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000,
      "Behavior:Win32/AmsiFailHeadlessPwsh.AM")
    add_parents()
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
