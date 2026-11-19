-- Threat: !InfrastructureShared
-- Name: 647805e4bd63
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
