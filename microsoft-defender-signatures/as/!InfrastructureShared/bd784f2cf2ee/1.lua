-- Threat: !InfrastructureShared
-- Name: bd784f2cf2ee
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
