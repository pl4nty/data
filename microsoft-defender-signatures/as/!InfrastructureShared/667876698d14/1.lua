-- Threat: !InfrastructureShared
-- Name: 667876698d14
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
