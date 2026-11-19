-- Threat: !InfrastructureShared
-- Name: !#Lua:AutoElevateUACRequests.A
-- Type: 10

local l_0_0 = mp.GetUACMetadata()
if l_0_0 ~= nil then
  if l_0_0.Type == mp.AMSI_UAC_REQUEST_TYPE_EXE and l_0_0.AutoElevate == true then
    return mp.LOWFI
  end
  if l_0_0.Type == mp.AMSI_UAC_REQUEST_TYPE_COM and (string.upper(l_0_0.Info.Clsid) == "3AD05575-8857-4850-9277-11B85BDB8E09" or string.upper(l_0_0.Info.Clsid) == "4D111E08-CBF7-4f12-A926-2C7920AF52FC") then
    return mp.LOWFI
  end
end
return mp.CLEAN
