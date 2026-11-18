-- Threat: !InfrastructureShared
-- Name: 5978e499fe7e
-- Type: 21

if peattributes.amd64_image and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
