-- Threat: !InfrastructureShared
-- Name: 47789e0e318a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
