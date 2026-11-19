-- Threat: !InfrastructureShared
-- Name: 74785aa7251d
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 600000 and mp.getfilesize() < 900000 and pe.get_exports_count() == 28 then
  return mp.INFECTED
end
return mp.CLEAN
