-- Threat: !InfrastructureShared
-- Name: 56782d3b047a
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
