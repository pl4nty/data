-- Threat: !InfrastructureShared
-- Name: !#PsAmsiByPass
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: SCPT:PS/WinAPIGetProcAddress & MpIsPowerShellAMSIScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 ~= nil then
  AddTacticForPid(l_0_0, "PS_GetProc", 3600)
  local l_0_1 = GetTacticsTableForPid(l_0_0)
  if l_0_1 ~= nil and 4 < #l_0_1 then
    mp.set_mpattribute("PS_AmsiBypass2")
  end
end
return mp.CLEAN
