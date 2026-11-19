-- Threat: !InfrastructureShared
-- Name: 6878a3a22bad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
