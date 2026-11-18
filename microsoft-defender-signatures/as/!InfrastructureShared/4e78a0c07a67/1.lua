-- Threat: !InfrastructureShared
-- Name: 4e78a0c07a67
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
