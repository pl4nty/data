-- Threat: !InfrastructureShared
-- Name: b37802856d97
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
