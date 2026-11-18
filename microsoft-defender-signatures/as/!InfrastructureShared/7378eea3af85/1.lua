-- Threat: !InfrastructureShared
-- Name: 7378eea3af85
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
