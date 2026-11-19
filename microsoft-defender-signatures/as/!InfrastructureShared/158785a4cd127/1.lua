-- Threat: !InfrastructureShared
-- Name: 158785a4cd127
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.LOWFI
