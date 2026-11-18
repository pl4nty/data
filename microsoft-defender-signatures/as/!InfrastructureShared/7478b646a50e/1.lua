-- Threat: !InfrastructureShared
-- Name: 7478b646a50e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
