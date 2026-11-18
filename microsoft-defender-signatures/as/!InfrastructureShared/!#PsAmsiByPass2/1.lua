-- Threat: !InfrastructureShared
-- Name: !#PsAmsiByPass2
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: SCPT:PS/GetFieldBypass.C & MpIsPowerShellAMSIScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 ~= nil then
  AddTacticForPid(l_0_0, "PS_SetValue", 3600)
  local l_0_1 = GetTacticsTableForPid(l_0_0)
  if l_0_1 ~= nil and l_0_1.PS_StrReplace and l_0_1.PS_Assembly and l_0_1.PS_SetValue then
    mp.set_mpattribute("PS_AmsiBypass4")
  end
end
return mp.CLEAN
