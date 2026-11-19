-- Threat: !InfrastructureShared
-- Name: 8e78ae7bb49e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
