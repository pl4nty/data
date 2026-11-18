-- Threat: !InfrastructureShared
-- Name: 8c7821f52d6a
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
