-- Threat: !InfrastructureShared
-- Name: 7978da1173aa
-- Type: 21

if peattributes.hasappendeddata and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
