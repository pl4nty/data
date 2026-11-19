-- Threat: !InfrastructureShared
-- Name: 270d72ca51c7d
-- Type: 21

if mp.get_mpattribute("Exclusion:Trojan:Win32/Ceprolad.A") then
  return mp.CLEAN
end
return mp.INFECTED
