-- Threat: !InfrastructureShared
-- Name: a178336c5be2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
