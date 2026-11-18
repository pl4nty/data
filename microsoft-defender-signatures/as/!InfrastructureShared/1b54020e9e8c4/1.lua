-- Threat: !InfrastructureShared
-- Name: 1b54020e9e8c4
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.x86_image and peattributes.hasappendeddata then
  return mp.INFECTED
end
return mp.CLEAN
