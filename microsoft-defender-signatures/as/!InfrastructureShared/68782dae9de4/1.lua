-- Threat: !InfrastructureShared
-- Name: 68782dae9de4
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
