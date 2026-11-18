-- Threat: !InfrastructureShared
-- Name: 3e78cc6beb57
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
