-- Threat: !InfrastructureShared
-- Name: a0789b75e1d9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
