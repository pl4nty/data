-- Threat: !InfrastructureShared
-- Name: !#CheckIfAmsiFromIIS
-- Type: 12

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if l_0_0 == "w3wp.exe" then
    local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
    if l_0_1 and l_0_2 ~= nil and l_0_2 == "DotNet" then
      mp.set_mpattribute("Lua:IsIISAmsiScan")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
