-- Threat: !InfrastructureShared
-- Name: 6b780b444129
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
