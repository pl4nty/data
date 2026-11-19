-- Threat: !InfrastructureShared
-- Name: 8978612bb2b2
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 4000000 then
  return mp.INFECTED
end
return mp.CLEAN
