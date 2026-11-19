-- Threat: !InfrastructureShared
-- Name: 55781bbe502a
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
