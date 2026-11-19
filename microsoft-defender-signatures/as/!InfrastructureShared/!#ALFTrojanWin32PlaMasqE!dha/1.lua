-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/PlaMasq.E!dha
-- Type: 9

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil and l_0_0.CompanyName ~= nil and l_0_0.CompanyName:find("Mizollo", 1, true) == 1 then
  return mp.INFECTED
end
return mp.CLEAN
