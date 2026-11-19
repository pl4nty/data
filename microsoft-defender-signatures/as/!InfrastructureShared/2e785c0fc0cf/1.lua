-- Threat: !InfrastructureShared
-- Name: 2e785c0fc0cf
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
