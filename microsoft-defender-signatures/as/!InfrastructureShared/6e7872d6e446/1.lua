-- Threat: !InfrastructureShared
-- Name: 6e7872d6e446
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
