-- Threat: !InfrastructureShared
-- Name: 647850bb0dc4
-- Type: 21

if peattributes.amd64_image and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
