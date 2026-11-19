-- Threat: !InfrastructureShared
-- Name: b578d1110e2b
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.get_mpattribute("pea_requests_elevation") then
  return mp.INFECTED
end
return mp.CLEAN
