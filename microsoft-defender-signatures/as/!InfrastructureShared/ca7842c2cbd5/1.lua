-- Threat: !InfrastructureShared
-- Name: ca7842c2cbd5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
