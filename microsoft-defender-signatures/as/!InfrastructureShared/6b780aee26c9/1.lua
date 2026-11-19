-- Threat: !InfrastructureShared
-- Name: 6b780aee26c9
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 550000 then
  return mp.INFECTED
end
return mp.CLEAN
