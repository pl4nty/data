-- Threat: !InfrastructureShared
-- Name: 365401cc6a833
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
