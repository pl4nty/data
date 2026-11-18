-- Threat: !InfrastructureShared
-- Name: 10578f13cf283
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
