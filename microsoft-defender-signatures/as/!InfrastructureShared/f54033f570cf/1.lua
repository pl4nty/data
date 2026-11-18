-- Threat: !InfrastructureShared
-- Name: f54033f570cf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
