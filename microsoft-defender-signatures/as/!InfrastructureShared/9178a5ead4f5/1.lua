-- Threat: !InfrastructureShared
-- Name: 9178a5ead4f5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
