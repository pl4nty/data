-- Threat: !InfrastructureShared
-- Name: 73780c6c3567
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
