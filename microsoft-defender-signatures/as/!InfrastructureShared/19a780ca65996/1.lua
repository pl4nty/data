-- Threat: !InfrastructureShared
-- Name: 19a780ca65996
-- Type: 21

if peattributes.isdll and mp.getfilesize() > 200000000 then
  return mp.INFECTED
end
return mp.CLEAN
