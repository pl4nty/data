-- Threat: !InfrastructureShared
-- Name: 5b78c300c682
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
