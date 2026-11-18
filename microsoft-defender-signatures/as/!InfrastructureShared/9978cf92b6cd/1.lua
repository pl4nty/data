-- Threat: !InfrastructureShared
-- Name: 9978cf92b6cd
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
