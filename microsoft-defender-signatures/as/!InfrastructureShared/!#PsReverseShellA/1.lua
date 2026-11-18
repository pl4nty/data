-- Threat: !InfrastructureShared
-- Name: !#PsReverseShell.A
-- Type: 13
-- MpAttributes: MpIsPowerShellAMSIScan & SCPT:AmsiPatch.A1 & SCPT:Trojan:PowerShell/ReverseShell.A & !SCPT:Allow:ReverseShell.A

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1 = {}
  if MpCommon.GetPersistContextCountNoPath("psfrag") >= 2 then
    mp.set_mpattribute("PS_Revershell")
  elseif MpCommon.GetPersistContextCountNoPath("psfrag") > 0 and not MpCommon.QueryPersistContextNoPath("psfrag", "p1") then
    MpCommon.AppendPersistContextNoPath("psfrag", "p1", 120)
  elseif not MpCommon.QueryPersistContextNoPath("psfrag", "p1") then
    table.insert(l_0_1, "p1")
    MpCommon.SetPersistContextNoPath("psfrag", l_0_1, 120)
  end
end
return mp.CLEAN
