-- Threat: !InfrastructureShared
-- Name: 4078babb65e4
-- Type: 21

if mp.get_mpattribute("NID:Trojan:Win64/StrelaStealer.MBXI!MTB") and mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
