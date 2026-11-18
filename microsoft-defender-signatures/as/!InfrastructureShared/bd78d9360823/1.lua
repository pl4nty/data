-- Threat: !InfrastructureShared
-- Name: bd78d9360823
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
