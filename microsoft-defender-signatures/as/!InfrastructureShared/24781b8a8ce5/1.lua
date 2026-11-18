-- Threat: !InfrastructureShared
-- Name: 24781b8a8ce5
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() >= 10000000 then
  return mp.INFECTED
end
return mp.CLEAN
