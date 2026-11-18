-- Threat: !InfrastructureShared
-- Name: 7b0d73c644e23
-- Type: 21

if mp.get_mpattribute("Exclusion:Trojan:Win32/Ceprolad.A") then
  return mp.CLEAN
end
return mp.INFECTED
