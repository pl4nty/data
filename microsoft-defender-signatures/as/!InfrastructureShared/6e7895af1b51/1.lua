-- Threat: !InfrastructureShared
-- Name: 6e7895af1b51
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 90000 and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
