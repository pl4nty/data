-- Threat: !InfrastructureShared
-- Name: 457827f07a3f
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
