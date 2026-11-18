-- Threat: !InfrastructureShared
-- Name: !#LuaReportAMSIOriginalSQLModuleToUI
-- Type: 28

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if l_0_1 then
  if l_0_2 ~= "SQL Server AMSI Agent" then
    return mp.CLEAN
  end
  local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_3 and l_0_4 ~= nil then
    mp.SetAmsiReportPath(l_0_4)
  end
end
return mp.CLEAN
