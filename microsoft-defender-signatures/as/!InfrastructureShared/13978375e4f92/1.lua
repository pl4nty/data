-- Threat: !InfrastructureShared
-- Name: 13978375e4f92
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 5200 then
  return mp.INFECTED
end
return mp.CLEAN
