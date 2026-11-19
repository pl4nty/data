-- Threat: !InfrastructureShared
-- Name: 6278d24258d7
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 5000 then
  return mp.INFECTED
end
return mp.CLEAN
