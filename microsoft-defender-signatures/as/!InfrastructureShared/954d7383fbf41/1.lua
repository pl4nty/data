-- Threat: !InfrastructureShared
-- Name: 954d7383fbf41
-- Type: 21

if mp.get_mpattribute("Exclusion:Trojan:Win32/Ceprolad.A") then
  return mp.CLEAN
end
return mp.INFECTED
