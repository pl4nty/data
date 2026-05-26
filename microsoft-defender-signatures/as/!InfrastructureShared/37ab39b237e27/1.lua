-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\37ab39b237e27\1.luac 

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
local l_0_3 = (string.lower)(l_0_2)
local l_0_4 = {}
-- DECOMPILER ERROR at PC58: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC59: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC60: Overwrote pending register: R6 in 'AssignReg'

for l_0_8,l_0_9 in ("\\desiredstateconfiguration\\")("\\dsc\\") do
  -- DECOMPILER ERROR at PC63: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R13 in 'AssignReg'

  if (("\\azuremonitoragent\\").find)("\\ccmexec\\", "\\ccm\\scriptstore\\", "\\intunemanagementextension\\", true) then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, l_0_9, 1, true) then
    return mp.CLEAN
  end
end
do
  local l_0_10 = ""
  -- DECOMPILER ERROR at PC200: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC202: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC222: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC224: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC244: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC273: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC302: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC313: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC342: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

  if not (string.find)(l_0_1, "localaccounttokenfilterpolicy", 1, true) or ((not (string.find)(l_0_1, "-value 1", 1, true) and not (string.find)(l_0_1, "-value \'1\'", 1, true) and not (string.find)(l_0_1, "-value \"1\"", 1, true) and not (string.find)(l_0_1, "-propertytype dword", 1, true) and (string.find)(l_0_1, "-value 0", 1, true)) or ((((((((not (string.find)(l_0_1, "\"*\"", 1, true) and not (string.find)(l_0_1, "\'*\'", 1, true) and not (string.find)(l_0_1, "-value *", 1, true) and not (string.find)(l_0_1, "-value \'*\'", 1, true) and not (string.find)(l_0_1, "-value \"*\"", 1, true)) or (string.find)(l_0_1, "enable-psremoting", 1, true)) and (string.find)(l_0_1, "-force", 1, true) and not (string.find)(l_0_1, "enable-wsmancredssp", 1, true)) or (string.find)(l_0_1, "allowunencrypted", 1, true)) and not (string.find)(l_0_1, "true", 1, true) and not (string.find)(l_0_1, "service\\auth\\basic", 1, true)) or (string.find)(l_0_1, "true", 1, true) or (string.find)(l_0_1, "quickconfig", 1, true)) and not (string.find)(l_0_1, "create", 1, true)) or isnull(l_0_10))) then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("WinRMSrvEn_reason", l_0_10, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("WinRMSrvEn_cmd", l_0_1, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1021.006", "SuspWinRMServerEnable")
  add_parents()
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

