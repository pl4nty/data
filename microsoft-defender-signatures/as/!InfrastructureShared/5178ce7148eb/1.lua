-- Threat: !InfrastructureShared
-- Name: 5178ce7148eb
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
