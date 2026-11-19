-- Threat: !InfrastructureShared
-- Name: 1c7868a6a4c3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
