-- Threat: !InfrastructureShared
-- Name: 557899d94f7b
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 196608 then
  return mp.INFECTED
end
return mp.CLEAN
