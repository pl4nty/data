-- Threat: !InfrastructureShared
-- Name: 3e7842871a8e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
