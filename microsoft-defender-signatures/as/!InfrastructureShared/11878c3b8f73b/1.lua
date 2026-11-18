-- Threat: !InfrastructureShared
-- Name: 11878c3b8f73b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
