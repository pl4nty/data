-- Threat: !InfrastructureShared
-- Name: 2778d04d7279
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
