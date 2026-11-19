-- Threat: !InfrastructureShared
-- Name: cd78b6e9ef62
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
