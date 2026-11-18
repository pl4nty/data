-- Threat: !InfrastructureShared
-- Name: 22c78bd0e52e9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
