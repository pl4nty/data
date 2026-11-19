-- Threat: !InfrastructureShared
-- Name: 103785f241024
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
