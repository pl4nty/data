-- Threat: !InfrastructureShared
-- Name: 6178282d45ef
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 100000 then
  return mp.INFECTED
end
return mp.CLEAN
