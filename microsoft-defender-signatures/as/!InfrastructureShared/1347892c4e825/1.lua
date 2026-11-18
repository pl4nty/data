-- Threat: !InfrastructureShared
-- Name: 1347892c4e825
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
