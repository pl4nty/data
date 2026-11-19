-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win32/SuspMailboxExport.B
-- Type: 13
-- MpAttributes: ALF:PowerShell/SuspMailboxExport.A

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 and l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  mp.ReportLowfi(l_0_1, 2004662694)
  return mp.INFECTED
end
return mp.CLEAN
