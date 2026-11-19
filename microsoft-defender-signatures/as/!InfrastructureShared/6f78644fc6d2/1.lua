-- Threat: !InfrastructureShared
-- Name: 6f78644fc6d2
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
