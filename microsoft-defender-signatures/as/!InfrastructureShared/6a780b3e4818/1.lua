-- Threat: !InfrastructureShared
-- Name: 6a780b3e4818
-- Type: 21

if peattributes.ismsil == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
