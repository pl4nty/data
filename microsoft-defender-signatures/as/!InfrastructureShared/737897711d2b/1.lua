-- Threat: !InfrastructureShared
-- Name: 737897711d2b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
