-- Threat: !InfrastructureShared
-- Name: 78781b67b3ae
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
