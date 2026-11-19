-- Threat: !InfrastructureShared
-- Name: 6d78ed8c785d
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
