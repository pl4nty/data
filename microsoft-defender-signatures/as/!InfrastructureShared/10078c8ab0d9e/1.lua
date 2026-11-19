-- Threat: !InfrastructureShared
-- Name: 10078c8ab0d9e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
