-- Threat: !InfrastructureShared
-- Name: 6378d7ae398d
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.hasappendeddata then
  return mp.INFECTED
end
return mp.CLEAN
