-- Threat: !InfrastructureShared
-- Name: 6a6187956974
-- Type: 21

if peattributes.no_security and peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
