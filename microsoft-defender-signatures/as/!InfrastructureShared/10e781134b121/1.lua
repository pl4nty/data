-- Threat: !InfrastructureShared
-- Name: 10e781134b121
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.LOWFI
