-- Threat: !InfrastructureShared
-- Name: 4f61a4f980cb
-- Type: 21

if peattributes.no_security and peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
