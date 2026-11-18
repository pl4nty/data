-- Threat: !InfrastructureShared
-- Name: 577833397acc
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
