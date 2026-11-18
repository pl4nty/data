-- Threat: !InfrastructureShared
-- Name: 5378d5fb55c5
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
