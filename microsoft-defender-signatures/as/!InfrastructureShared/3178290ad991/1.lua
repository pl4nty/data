-- Threat: !InfrastructureShared
-- Name: 3178290ad991
-- Type: 21

if peattributes.amd64_image and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
