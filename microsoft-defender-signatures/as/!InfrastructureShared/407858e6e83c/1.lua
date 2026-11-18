-- Threat: !InfrastructureShared
-- Name: 407858e6e83c
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
