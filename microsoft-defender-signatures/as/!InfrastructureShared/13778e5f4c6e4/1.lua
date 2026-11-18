-- Threat: !InfrastructureShared
-- Name: 13778e5f4c6e4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
