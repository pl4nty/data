-- Threat: !InfrastructureShared
-- Name: !#ALF:Hacktool:MSIL/SharpExchangeKing.A!dha
-- Type: 10

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0.OriginalFilename
  local l_0_2 = l_0_0.ProductName
  if l_0_1 == nil or l_0_2 == nil then
    return mp.CLEAN
  end
  if l_0_1 == "SharpExchangeKing.exe" and l_0_2 == "ExchangeKing" then
    return mp.INFECTED
  end
end
return mp.CLEAN
