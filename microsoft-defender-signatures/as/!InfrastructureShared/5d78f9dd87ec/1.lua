-- Threat: !InfrastructureShared
-- Name: 5d78f9dd87ec
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
