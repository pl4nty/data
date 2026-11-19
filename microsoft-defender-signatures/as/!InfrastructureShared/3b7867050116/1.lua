-- Threat: !InfrastructureShared
-- Name: 3b7867050116
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
