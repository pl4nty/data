-- Threat: !InfrastructureShared
-- Name: 93619083b6e9
-- Type: 21
-- Flags: 1

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.LOWFI
