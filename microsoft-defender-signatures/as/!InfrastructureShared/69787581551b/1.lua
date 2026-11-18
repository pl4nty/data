-- Threat: !InfrastructureShared
-- Name: 69787581551b
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
