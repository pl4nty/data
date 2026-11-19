-- Threat: !InfrastructureShared
-- Name: 55784d7dd030
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
