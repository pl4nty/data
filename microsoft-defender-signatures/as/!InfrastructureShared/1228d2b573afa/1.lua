-- Threat: !InfrastructureShared
-- Name: 1228d2b573afa
-- Type: 21

if machohdr.Magic == 4277009103 or machohdr.Magic == 3405691582 then
  return mp.INFECTED
end
return mp.CLEAN
