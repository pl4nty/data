-- Threat: !InfrastructureShared
-- Name: a078484e3fdc
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
