-- Threat: !InfrastructureShared
-- Name: 1a78a4a6fa5e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
