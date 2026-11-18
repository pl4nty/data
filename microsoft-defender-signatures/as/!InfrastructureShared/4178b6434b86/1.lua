-- Threat: !InfrastructureShared
-- Name: 4178b6434b86
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
