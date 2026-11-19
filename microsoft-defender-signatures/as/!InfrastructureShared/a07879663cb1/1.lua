-- Threat: !InfrastructureShared
-- Name: a07879663cb1
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
