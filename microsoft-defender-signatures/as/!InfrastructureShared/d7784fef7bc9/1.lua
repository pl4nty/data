-- Threat: !InfrastructureShared
-- Name: d7784fef7bc9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
