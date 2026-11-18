-- Threat: !InfrastructureShared
-- Name: 2d7815c04ad5
-- Type: 21

if peattributes.amd64_image and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
