-- Threat: !InfrastructureShared
-- Name: 7d78824ba5e6
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
