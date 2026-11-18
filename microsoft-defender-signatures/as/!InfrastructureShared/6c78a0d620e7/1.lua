-- Threat: !InfrastructureShared
-- Name: 6c78a0d620e7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
