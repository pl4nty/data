-- Threat: !InfrastructureShared
-- Name: 2b785bf7bbea
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
