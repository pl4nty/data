-- Threat: !InfrastructureShared
-- Name: 2a78b2327611
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
