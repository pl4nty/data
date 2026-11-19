-- Threat: !InfrastructureShared
-- Name: 72781c21651d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
