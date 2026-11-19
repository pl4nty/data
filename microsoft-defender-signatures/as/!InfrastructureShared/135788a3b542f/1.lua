-- Threat: !InfrastructureShared
-- Name: 135788a3b542f
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
