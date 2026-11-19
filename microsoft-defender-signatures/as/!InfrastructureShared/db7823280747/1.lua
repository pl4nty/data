-- Threat: !InfrastructureShared
-- Name: db7823280747
-- Type: 21

if peattributes.no_security and peattributes.isdll and mp.getfilesize() < 21000 and pe.get_exports_count() >= 13 and pe.get_exports_count() <= 15 then
  return mp.INFECTED
end
return mp.CLEAN
