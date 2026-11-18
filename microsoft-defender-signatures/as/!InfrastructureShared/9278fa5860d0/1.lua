-- Threat: !InfrastructureShared
-- Name: 9278fa5860d0
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
