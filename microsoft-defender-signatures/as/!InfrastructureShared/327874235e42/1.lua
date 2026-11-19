-- Threat: !InfrastructureShared
-- Name: 327874235e42
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
