-- Threat: !InfrastructureShared
-- Name: 1aa6189945a4a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
