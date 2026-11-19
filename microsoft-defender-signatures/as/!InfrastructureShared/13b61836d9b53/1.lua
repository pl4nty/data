-- Threat: !InfrastructureShared
-- Name: 13b61836d9b53
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
