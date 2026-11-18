-- Threat: !InfrastructureShared
-- Name: 1978dfc5465e
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win32/Symmi.MBXJ!MTB") and mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
