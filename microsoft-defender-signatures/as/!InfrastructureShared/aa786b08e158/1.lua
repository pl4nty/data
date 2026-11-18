-- Threat: !InfrastructureShared
-- Name: aa786b08e158
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
