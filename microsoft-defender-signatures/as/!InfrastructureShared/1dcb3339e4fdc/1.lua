-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1dcb3339e4fdc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.command_line) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (bm.get_imagepath)()
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = nil
if (string.find)(l_0_2, "\\powershell.exe", 1, true) then
  l_0_3 = "powershell"
else
  if (string.find)(l_0_2, "\\pwsh.exe", 1, true) then
    l_0_3 = "pwsh"
  else
    return mp.CLEAN
  end
end
local l_0_4 = nil
if (string.find)(l_0_1, "invoke-command", 1, true) then
  l_0_4 = "invoke-command"
else
  if (string.find)(l_0_1, "new-pssession", 1, true) then
    l_0_4 = "new-pssession"
  else
    if (string.find)(l_0_1, "enter-pssession", 1, true) then
      l_0_4 = "enter-pssession"
    else
      return mp.CLEAN
    end
  end
end
if not (string.find)(l_0_1, "-computername", 1, true) and not (string.find)(l_0_1, "-cn ", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "-computername localhost", 1, true) or (string.find)(l_0_1, "-computername .", 1, true) or (string.find)(l_0_1, "-computername 127.0.0.1", 1, true) or (string.find)(l_0_1, "-computername $env:computername", 1, true) then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC180: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC181: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC182: Overwrote pending register: R7 in 'AssignReg'

for l_0_9,l_0_10 in ("\\desiredstateconfiguration\\")("\\dsc\\") do
  -- DECOMPILER ERROR at PC185: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC187: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC188: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC189: Overwrote pending register: R14 in 'AssignReg'

  if (("\\azuremonitoragent\\").find)("\\ccmexec\\", "\\ccm\\scriptstore\\", "\\intunemanagementextension\\", true) then
    return mp.CLEAN
  end
end
do
  local l_0_11 = ""
  -- DECOMPILER ERROR at PC220: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC231: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC269: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC289: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC309: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC317: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC317: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC317: Unhandled construct in 'MakeBoolean' P3

  if ((((((string.find)(l_0_1, "-credential", 1, true) and not (string.find)(l_0_1, "-authentication credssp", 1, true)) or (string.find)(l_0_1, "-authentication basic", 1, true)) and not (string.find)(l_0_1, "-usessl", 1, true)) or (string.find)(l_0_1, "-skipcacheck", 1, true) or (string.find)(l_0_1, "-skipcncheck", 1, true) or (string.find)(l_0_1, "convertto-securestring", 1, true)) and not (string.find)(l_0_1, "frombase64string", 1, true)) or isnull(l_0_11) then
    return mp.CLEAN
  end
  WinRMSessionTrackProcess("BM", nil, "Client")
  ;
  (mp.set_mpattribute)("Lua:ContextDataProcess/WinRMSessionProcess.A")
  ;
  (mp.set_mpattribute)("Lua:ContextDataProcess/WinRMClientProcess.A")
  ;
  (bm.add_related_string)("WinRMLM_reason", l_0_11, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("WinRMLM_cmdlet", l_0_4, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("WinRMLM_host", l_0_3, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("WinRMLM_cmd", l_0_1, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMLateralMove")
  add_parents()
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

