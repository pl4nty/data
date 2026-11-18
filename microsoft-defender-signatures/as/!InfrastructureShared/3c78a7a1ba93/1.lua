-- Threat: !InfrastructureShared
-- Name: 3c78a7a1ba93
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
