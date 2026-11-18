-- Threat: !InfrastructureShared
-- Name: b87838131648
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
