-- Threat: !InfrastructureShared
-- Name: 4a781a9cdbf0
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
