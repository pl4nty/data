-- Threat: !InfrastructureShared
-- Name: 24783265d20c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
