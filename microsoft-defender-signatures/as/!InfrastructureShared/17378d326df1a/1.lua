-- Threat: !InfrastructureShared
-- Name: 17378d326df1a
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 702000 then
  return mp.INFECTED
end
return mp.CLEAN
