-- Threat: !InfrastructureShared
-- Name: d078f8004e4f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
