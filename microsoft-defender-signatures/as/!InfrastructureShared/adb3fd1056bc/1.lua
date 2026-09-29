-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3fd1056bc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line or "")
local l_0_2 = ""
local l_0_3 = ""
local l_0_4 = (mp.GetParentProcInfo)()
if l_0_4 and l_0_4.image_path then
  l_0_2 = (string.lower)(l_0_4.image_path)
end
if not (mp.GetProcessCommandLine)(l_0_4.ppid) then
  l_0_3 = (string.lower)(not l_0_4 or not l_0_4.ppid or "")
  do
    if not contains(l_0_1, "--headless") and contains(l_0_2, "\\conhost.exe") then
      local l_0_5 = contains(l_0_3, "--headless")
    end
    -- DECOMPILER ERROR at PC67: Confused about usage of register: R5 in 'UnsetPending'

    if not l_0_5 then
      return mp.CLEAN
    end
    local l_0_6 = nil
    local l_0_7 = contains
    local l_0_8 = l_0_2
    l_0_7 = l_0_7(l_0_8, {"agentexecutor.exe", "\\code.exe", "windowsterminal.exe"})
    if l_0_7 then
      l_0_7 = mp
      l_0_7 = l_0_7.CLEAN
      return l_0_7
    end
    l_0_7 = bm
    l_0_7 = l_0_7.add_related_string
    l_0_8 = "[->] AMSI-FAIL HEADLESS PWSH: "
    l_0_7(l_0_8, l_0_1, bm.RelatedStringBMReport)
    l_0_7 = bm_AddRelatedFileFromCommandLine
    l_0_8 = l_0_1
    l_0_7(l_0_8, nil, nil, 1)
    l_0_7 = l_0_0.ppid
    if l_0_7 then
      l_0_7 = bm
      l_0_7 = l_0_7.request_SMS
      l_0_8 = l_0_0.ppid
      l_0_7(l_0_8, "h+")
      l_0_7 = bm
      l_0_7 = l_0_7.add_action
      l_0_8 = "SmsAsyncScanEvent"
      l_0_7(l_0_8, 1)
    end
    l_0_7 = triggerMemoryScanOnProcessTree
    l_0_8 = true
    l_0_7(l_0_8, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailHeadlessPwsh.AM")
    l_0_7 = add_parents
    l_0_7()
    l_0_7 = mp
    l_0_7 = l_0_7.INFECTED
    return l_0_7
  end
end

