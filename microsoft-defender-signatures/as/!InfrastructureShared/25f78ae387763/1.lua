-- Threat: !InfrastructureShared
-- Name: 25f78ae387763
-- Type: 21

if peattributes.ismsil == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
