-- Threat: !InfrastructureShared
-- Name: bc780c916a70
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
