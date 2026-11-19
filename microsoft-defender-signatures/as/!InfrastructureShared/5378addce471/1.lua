-- Threat: !InfrastructureShared
-- Name: 5378addce471
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1500000 and pe.get_exports_count() > 200 then
  return mp.INFECTED
end
return mp.CLEAN
