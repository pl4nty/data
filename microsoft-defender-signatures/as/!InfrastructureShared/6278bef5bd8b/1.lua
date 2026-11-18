-- Threat: !InfrastructureShared
-- Name: 6278bef5bd8b
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
