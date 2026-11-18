-- Threat: !InfrastructureShared
-- Name: 6878e9177b4e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
