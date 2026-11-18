-- Threat: !InfrastructureShared
-- Name: 4d78e0fc090b
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
