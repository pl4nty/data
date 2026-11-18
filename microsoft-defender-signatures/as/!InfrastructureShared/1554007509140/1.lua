-- Threat: !InfrastructureShared
-- Name: 1554007509140
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
