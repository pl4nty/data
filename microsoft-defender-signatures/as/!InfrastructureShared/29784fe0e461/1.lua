-- Threat: !InfrastructureShared
-- Name: 29784fe0e461
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
