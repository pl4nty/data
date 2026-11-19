-- Threat: !InfrastructureShared
-- Name: 1088dab0f0909
-- Type: 21

if machohdr.Magic == 4277009103 or machohdr.Magic == 3405691582 then
  return mp.INFECTED
end
return mp.CLEAN
