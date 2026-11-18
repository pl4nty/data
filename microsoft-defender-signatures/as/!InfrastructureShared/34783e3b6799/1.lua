-- Threat: !InfrastructureShared
-- Name: 34783e3b6799
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
