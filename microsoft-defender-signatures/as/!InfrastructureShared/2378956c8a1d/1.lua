-- Threat: !InfrastructureShared
-- Name: 2378956c8a1d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
