-- Threat: !InfrastructureShared
-- Name: 2278db4038a7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
