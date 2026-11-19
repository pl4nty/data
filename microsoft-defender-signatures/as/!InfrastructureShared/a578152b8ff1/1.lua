-- Threat: !InfrastructureShared
-- Name: a578152b8ff1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
