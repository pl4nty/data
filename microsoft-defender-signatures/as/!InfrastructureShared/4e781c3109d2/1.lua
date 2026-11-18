-- Threat: !InfrastructureShared
-- Name: 4e781c3109d2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
