-- Threat: !InfrastructureShared
-- Name: 2f78bef83f1f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
