-- Threat: !InfrastructureShared
-- Name: ed78467249ff
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
