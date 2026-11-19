-- Threat: !InfrastructureShared
-- Name: 447847092b03
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
