-- Threat: !InfrastructureShared
-- Name: 7778e1f2f200
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
