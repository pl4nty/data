-- Threat: !InfrastructureShared
-- Name: 837826967242
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() > 2000000 and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
