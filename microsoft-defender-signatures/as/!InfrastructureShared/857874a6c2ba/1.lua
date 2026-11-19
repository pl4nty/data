-- Threat: !InfrastructureShared
-- Name: 857874a6c2ba
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
