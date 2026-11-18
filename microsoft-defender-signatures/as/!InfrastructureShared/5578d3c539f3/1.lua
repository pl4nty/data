-- Threat: !InfrastructureShared
-- Name: 5578d3c539f3
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
