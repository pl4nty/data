-- Threat: !InfrastructureShared
-- Name: 129781c0abd21
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
