-- Threat: !InfrastructureShared
-- Name: 1c78dd8bbd2f
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
