-- Threat: !InfrastructureShared
-- Name: 2778f8870a1e
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
