-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/LongScythe.A!dha
-- Type: 10

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil then
  local l_0_1 = l_0_0.CompanyName
  local l_0_2 = l_0_0.ProductName
  if l_0_1 == "Alpha programming team" and l_0_2 == "Dragon" then
    return mp.INFECTED
  end
end
return mp.CLEAN
