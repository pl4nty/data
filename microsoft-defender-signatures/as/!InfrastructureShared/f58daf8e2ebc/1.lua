-- Threat: !InfrastructureShared
-- Name: f58daf8e2ebc
-- Type: 21

if machohdr.Magic == 4277009103 or machohdr.Magic == 3405691582 then
  return mp.INFECTED
end
return mp.CLEAN
