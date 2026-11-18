-- Threat: !InfrastructureShared
-- Name: 4778ba5794fc
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
