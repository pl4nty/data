-- Threat: !InfrastructureShared
-- Name: 5278466be572
-- Type: 21

if peattributes.no_security and peattributes.isdll and pe.get_exports_count() <= 6 then
  return mp.INFECTED
end
return mp.CLEAN
