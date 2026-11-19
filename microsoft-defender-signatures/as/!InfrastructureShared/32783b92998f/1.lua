-- Threat: !InfrastructureShared
-- Name: 32783b92998f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
