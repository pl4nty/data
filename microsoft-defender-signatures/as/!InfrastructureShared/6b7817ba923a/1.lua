-- Threat: !InfrastructureShared
-- Name: 6b7817ba923a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
