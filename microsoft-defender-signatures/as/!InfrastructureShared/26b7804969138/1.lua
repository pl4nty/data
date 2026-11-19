-- Threat: !InfrastructureShared
-- Name: 26b7804969138
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
