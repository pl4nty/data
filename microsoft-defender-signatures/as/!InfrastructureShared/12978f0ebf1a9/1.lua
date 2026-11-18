-- Threat: !InfrastructureShared
-- Name: 12978f0ebf1a9
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
