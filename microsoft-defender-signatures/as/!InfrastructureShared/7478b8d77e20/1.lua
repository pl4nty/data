-- Threat: !InfrastructureShared
-- Name: 7478b8d77e20
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
