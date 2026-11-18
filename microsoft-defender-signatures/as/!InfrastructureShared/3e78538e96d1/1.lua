-- Threat: !InfrastructureShared
-- Name: 3e78538e96d1
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 420000 then
  return mp.INFECTED
end
return mp.CLEAN
