-- Threat: !InfrastructureShared
-- Name: 11978292d2283
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
