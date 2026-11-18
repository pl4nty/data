-- Threat: !InfrastructureShared
-- Name: 2878b18e0a47
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
