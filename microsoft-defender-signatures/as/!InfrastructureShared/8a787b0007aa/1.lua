-- Threat: !InfrastructureShared
-- Name: 8a787b0007aa
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
