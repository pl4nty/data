-- Threat: !InfrastructureShared
-- Name: 19d78308d5eea
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
