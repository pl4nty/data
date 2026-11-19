-- Threat: !InfrastructureShared
-- Name: 5378c9049704
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
