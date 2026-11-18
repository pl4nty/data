-- Threat: !InfrastructureShared
-- Name: a478be9a03be
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
