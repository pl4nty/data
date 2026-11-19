-- Threat: !InfrastructureShared
-- Name: 9c78d7452981
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 1000000 and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
