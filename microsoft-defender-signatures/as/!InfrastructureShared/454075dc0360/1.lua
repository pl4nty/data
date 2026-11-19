-- Threat: !InfrastructureShared
-- Name: 454075dc0360
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
