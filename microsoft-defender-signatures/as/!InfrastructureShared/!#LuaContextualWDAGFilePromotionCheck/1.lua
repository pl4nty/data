-- Threat: !InfrastructureShared
-- Name: !#LuaContextualWDAGFilePromotionCheck
-- Type: 24
-- MpAttributes: MpIsWdagAMSIScan

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 and sysio.IsFileExists(l_0_1) then
  mp.ReportLowfi(l_0_1, 3167174242)
  return mp.INFECTED
end
return mp.CLEAN
