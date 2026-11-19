-- Threat: !InfrastructureShared
-- Name: 25788fea9bf6
-- Type: 21

if peattributes.isdll == true and pe.get_exports_count() == 5 then
  return mp.INFECTED
end
return mp.CLEAN
