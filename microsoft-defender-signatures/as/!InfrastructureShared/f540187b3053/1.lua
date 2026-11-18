-- Threat: !InfrastructureShared
-- Name: f540187b3053
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
