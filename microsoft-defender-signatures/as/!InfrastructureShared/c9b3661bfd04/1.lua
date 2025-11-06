-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c9b3661bfd04\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line)
local l_0_2 = {}
-- DECOMPILER ERROR at PC31: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC32: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R5 in 'AssignReg'

if ("azure")("datadog", "splunk") then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = l_0_3.image_path
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC54: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC56: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC57: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC61: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC63: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R8 in 'AssignReg'

  if ("servicenow")("\\windows\\system32\\", "\\windows\\syswow64\\") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC76: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R10 in 'AssignReg'

  bm_AddRelatedFileFromCommandLine(l_0_1, nil, "program files\\microsoft", "checkmk")
  if l_0_0.ppid then
    (bm.request_SMS)(l_0_0.ppid, "h+")
    ;
    (bm.add_action)("SmsAsyncScanEvent", 1)
  end
  ;
  (bm.add_related_string)("[->] COMMAND: ", l_0_0.command_line, bm.RelatedStringBMReport)
  -- DECOMPILER ERROR at PC104: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC106: Overwrote pending register: R13 in 'AssignReg'

  pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "TaniumReceiver.exe", "SQLAGENT.EXE", "frontserver.exe")
  add_parents()
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

