-- Threat: !InfrastructureShared
-- Name: 987893173f3c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
