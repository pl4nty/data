-- Threat: !InfrastructureShared
-- Name: 4878002f1a42
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
