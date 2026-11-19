-- Threat: !InfrastructureShared
-- Name: 6a78b882c7ee
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
