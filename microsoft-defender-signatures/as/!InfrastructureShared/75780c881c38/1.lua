-- Threat: !InfrastructureShared
-- Name: 75780c881c38
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
