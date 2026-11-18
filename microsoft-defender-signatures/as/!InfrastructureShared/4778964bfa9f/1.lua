-- Threat: !InfrastructureShared
-- Name: 4778964bfa9f
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
