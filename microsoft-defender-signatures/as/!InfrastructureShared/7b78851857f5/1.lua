-- Threat: !InfrastructureShared
-- Name: 7b78851857f5
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
