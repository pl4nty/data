-- Threat: !InfrastructureShared
-- Name: cd78d3aef3b7
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
