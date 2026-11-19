-- Threat: !InfrastructureShared
-- Name: 4e780b3b9f25
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
