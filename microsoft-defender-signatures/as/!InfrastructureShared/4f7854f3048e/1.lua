-- Threat: !InfrastructureShared
-- Name: 4f7854f3048e
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
