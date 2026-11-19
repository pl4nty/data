-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/AlfieSore.D!dha
-- Type: 9

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil and l_0_0.CompanyName == "Brain Damage LLC" then
  return mp.INFECTED
end
return mp.CLEAN
