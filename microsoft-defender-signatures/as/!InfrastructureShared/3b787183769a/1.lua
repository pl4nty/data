-- Threat: !InfrastructureShared
-- Name: 3b787183769a
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 200000 and mp.getfilesize() < 380000 then
  return mp.INFECTED
end
return mp.CLEAN
