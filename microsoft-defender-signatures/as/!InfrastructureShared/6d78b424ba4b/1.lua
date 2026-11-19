-- Threat: !InfrastructureShared
-- Name: 6d78b424ba4b
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 49000 then
  return mp.INFECTED
end
return mp.CLEAN
