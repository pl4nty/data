-- Threat: !InfrastructureShared
-- Name: 92785d65d050
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
