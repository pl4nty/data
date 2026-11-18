-- Threat: !InfrastructureShared
-- Name: 907876b952e6
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
