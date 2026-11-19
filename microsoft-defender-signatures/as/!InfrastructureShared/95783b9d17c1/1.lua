-- Threat: !InfrastructureShared
-- Name: 95783b9d17c1
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 74304 then
  return mp.INFECTED
end
return mp.CLEAN
