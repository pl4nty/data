-- Threat: !InfrastructureShared
-- Name: 67786c7361f7
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
