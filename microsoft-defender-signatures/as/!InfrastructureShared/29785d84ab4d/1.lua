-- Threat: !InfrastructureShared
-- Name: 29785d84ab4d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
