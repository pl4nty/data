-- Threat: !InfrastructureShared
-- Name: 5478c7ac78c8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
