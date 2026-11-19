-- Threat: !InfrastructureShared
-- Name: 1e78f14c17b7
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
