-- Threat: !InfrastructureShared
-- Name: 9678627c2774
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
