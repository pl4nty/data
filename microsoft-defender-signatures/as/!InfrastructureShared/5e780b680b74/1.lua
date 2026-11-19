-- Threat: !InfrastructureShared
-- Name: 5e780b680b74
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
