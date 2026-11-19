-- Threat: !InfrastructureShared
-- Name: da784f3dd22f
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
