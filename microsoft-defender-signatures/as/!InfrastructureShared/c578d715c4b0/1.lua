-- Threat: !InfrastructureShared
-- Name: c578d715c4b0
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
