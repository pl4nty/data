-- Threat: !InfrastructureShared
-- Name: a540e0736a8d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
