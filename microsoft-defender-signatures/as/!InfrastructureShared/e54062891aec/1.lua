-- Threat: !InfrastructureShared
-- Name: e54062891aec
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
