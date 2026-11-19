-- Threat: !InfrastructureShared
-- Name: e978f69ae3fd
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
