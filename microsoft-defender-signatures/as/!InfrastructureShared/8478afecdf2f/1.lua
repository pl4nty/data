-- Threat: !InfrastructureShared
-- Name: 8478afecdf2f
-- Type: 21

if peattributes.no_security == true and pe.get_exports_count() == 1 and peattributes.isdll and mp.getfilesize() > 180000 and mp.getfilesize() < 250000 then
  return mp.INFECTED
end
return mp.CLEAN
