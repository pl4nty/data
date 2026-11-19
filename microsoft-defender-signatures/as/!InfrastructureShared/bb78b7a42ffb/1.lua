-- Threat: !InfrastructureShared
-- Name: bb78b7a42ffb
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
