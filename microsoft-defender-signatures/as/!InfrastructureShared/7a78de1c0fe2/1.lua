-- Threat: !InfrastructureShared
-- Name: 7a78de1c0fe2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
