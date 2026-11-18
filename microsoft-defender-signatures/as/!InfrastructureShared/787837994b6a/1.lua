-- Threat: !InfrastructureShared
-- Name: 787837994b6a
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
