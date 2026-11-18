-- Threat: !InfrastructureShared
-- Name: 467896f89b9c
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
