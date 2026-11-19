-- Threat: !InfrastructureShared
-- Name: 7d789a180106
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 42000 then
  return mp.INFECTED
end
return mp.CLEAN
