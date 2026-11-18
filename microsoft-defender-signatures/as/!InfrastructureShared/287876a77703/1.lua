-- Threat: !InfrastructureShared
-- Name: 287876a77703
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
