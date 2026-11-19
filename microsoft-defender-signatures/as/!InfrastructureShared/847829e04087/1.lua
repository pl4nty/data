-- Threat: !InfrastructureShared
-- Name: 847829e04087
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
