-- Threat: !InfrastructureShared
-- Name: 107784d4aac04
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.hasappendeddata then
  return mp.INFECTED
end
return mp.CLEAN
