-- Threat: !InfrastructureShared
-- Name: b56189ac9f7f
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT == 7 and mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.LOWFI
