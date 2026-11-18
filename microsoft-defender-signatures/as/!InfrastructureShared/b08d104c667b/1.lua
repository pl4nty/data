-- Threat: !InfrastructureShared
-- Name: b08d104c667b
-- Type: 21

if machohdr.Magic == 4277009103 or machohdr.Magic == 3405691582 then
  return mp.INFECTED
end
return mp.CLEAN
