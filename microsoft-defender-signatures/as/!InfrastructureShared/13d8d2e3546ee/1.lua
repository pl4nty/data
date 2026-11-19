-- Threat: !InfrastructureShared
-- Name: 13d8d2e3546ee
-- Type: 21

if machohdr.Magic == 4277009103 or machohdr.Magic == 3405691582 then
  return mp.INFECTED
end
return mp.CLEAN
