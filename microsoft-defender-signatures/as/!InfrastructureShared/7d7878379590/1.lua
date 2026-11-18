-- Threat: !InfrastructureShared
-- Name: 7d7878379590
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
