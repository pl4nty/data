-- Threat: !InfrastructureShared
-- Name: 98787d2b39f5
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
