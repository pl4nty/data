-- Threat: !InfrastructureShared
-- Name: 297831e3d287
-- Type: 21

if mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
