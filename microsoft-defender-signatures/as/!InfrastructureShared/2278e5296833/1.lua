-- Threat: !InfrastructureShared
-- Name: 2278e5296833
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
