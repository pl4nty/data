-- Threat: !InfrastructureShared
-- Name: 42786c55e1d8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
