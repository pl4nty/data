-- Threat: !InfrastructureShared
-- Name: 4d78301686ba
-- Type: 21

if peattributes.amd64_image and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
