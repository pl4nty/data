-- Threat: !InfrastructureShared
-- Name: c078225e5e03
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
