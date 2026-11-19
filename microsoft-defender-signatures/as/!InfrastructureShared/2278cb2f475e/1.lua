-- Threat: !InfrastructureShared
-- Name: 2278cb2f475e
-- Type: 21

if peattributes.amd64_image and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
