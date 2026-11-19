-- Threat: !InfrastructureShared
-- Name: 216785d02915e
-- Type: 21

if peattributes.isdll and mp.getfilesize() > 200000000 then
  return mp.INFECTED
end
return mp.CLEAN
