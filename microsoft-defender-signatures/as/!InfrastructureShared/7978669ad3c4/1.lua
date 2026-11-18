-- Threat: !InfrastructureShared
-- Name: 7978669ad3c4
-- Type: 21

if peattributes.no_security == true and pe.get_exports_count() == 1 and mp.getfilesize() > 400000 and mp.getfilesize() < 450000 then
  return mp.INFECTED
end
return mp.CLEAN
