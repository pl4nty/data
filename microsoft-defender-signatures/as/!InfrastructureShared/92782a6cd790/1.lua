-- Threat: !InfrastructureShared
-- Name: 92782a6cd790
-- Type: 21

if peattributes.ismsil and peattributes.amd64_image and peattributes.hasappendeddata and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
