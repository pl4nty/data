-- Threat: !InfrastructureShared
-- Name: 5f78478acd25
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
