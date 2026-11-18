-- Threat: !InfrastructureShared
-- Name: 1d4781c5cb7c1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
