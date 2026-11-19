-- Threat: !InfrastructureShared
-- Name: 8f786ac5af2b
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
