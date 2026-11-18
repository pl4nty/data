-- Threat: !InfrastructureShared
-- Name: 1c78611532dc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
