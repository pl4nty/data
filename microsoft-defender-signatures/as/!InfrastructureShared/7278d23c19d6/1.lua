-- Threat: !InfrastructureShared
-- Name: 7278d23c19d6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
