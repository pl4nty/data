-- Threat: !InfrastructureShared
-- Name: 757895ce4312
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
