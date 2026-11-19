-- Threat: !InfrastructureShared
-- Name: 7d78e5480d7e
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 250000 then
  return mp.INFECTED
end
return mp.CLEAN
