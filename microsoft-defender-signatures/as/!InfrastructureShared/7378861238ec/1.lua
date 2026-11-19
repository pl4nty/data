-- Threat: !InfrastructureShared
-- Name: 7378861238ec
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
