-- Threat: !InfrastructureShared
-- Name: !#TerminateAmsiProcess
-- Type: 28

if not mp.get_mpattribute("MpIsVBScriptAMSIScan") and not mp.get_mpattribute("MpIsJScriptAMSIScan") and not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
local l_0_0 = {}
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
table.insert(l_0_0, l_0_1)
MpCommon.SetPersistContextNoPath("amsidetct", l_0_0, 120)
return mp.CLEAN
