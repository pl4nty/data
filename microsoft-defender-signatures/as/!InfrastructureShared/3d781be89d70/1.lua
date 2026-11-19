-- Threat: !InfrastructureShared
-- Name: 3d781be89d70
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
