-- Threat: !InfrastructureShared
-- Name: a178184d82c3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
