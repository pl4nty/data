-- Threat: !InfrastructureShared
-- Name: 337891b8e31f
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 10485760 then
  return mp.INFECTED
end
return mp.CLEAN
