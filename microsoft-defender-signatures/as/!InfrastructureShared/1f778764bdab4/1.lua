-- Threat: !InfrastructureShared
-- Name: 1f778764bdab4
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
