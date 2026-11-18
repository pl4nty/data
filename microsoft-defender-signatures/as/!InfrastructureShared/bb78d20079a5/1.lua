-- Threat: !InfrastructureShared
-- Name: bb78d20079a5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
