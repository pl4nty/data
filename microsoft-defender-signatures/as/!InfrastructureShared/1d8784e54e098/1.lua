-- Threat: !InfrastructureShared
-- Name: 1d8784e54e098
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
