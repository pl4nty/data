-- Threat: !InfrastructureShared
-- Name: 4d78a8e0602d
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
