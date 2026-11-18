-- Threat: !InfrastructureShared
-- Name: 4d78135093c4
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
