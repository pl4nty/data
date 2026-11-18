-- Threat: !InfrastructureShared
-- Name: 4a78d0909733
-- Type: 21

if peattributes.isdll == true and (pe.get_exports_count() == 11 or pe.get_exports_count() == 31) then
  return mp.INFECTED
end
return mp.CLEAN
