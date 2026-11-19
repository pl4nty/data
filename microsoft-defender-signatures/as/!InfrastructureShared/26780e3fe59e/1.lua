-- Threat: !InfrastructureShared
-- Name: 26780e3fe59e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
