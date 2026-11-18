-- Threat: !InfrastructureShared
-- Name: 6c789706d7f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
