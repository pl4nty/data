-- Threat: !InfrastructureShared
-- Name: !#PsAmsiByPass1
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: (SCRIPT:PowerShell/DllImport | ALF:Trojan/PSDynamicAssembly.B1) & MpIsPowerShellAMSIScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 ~= nil then
  AddTacticForPid(l_0_0, "PS_LoadLib", 3600)
  local l_0_1 = GetTacticsTableForPid(l_0_0)
  if l_0_1 ~= nil and l_0_1.PS_LoadLib and l_0_1.PS_GetProc and l_0_1.PS_VirtualProt then
    mp.set_mpattribute("PS_AmsiBypass3")
  end
end
return mp.CLEAN
