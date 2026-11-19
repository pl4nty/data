-- Threat: !InfrastructureShared
-- Name: 9b783a66d394
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
