-- Threat: !InfrastructureShared
-- Name: 37783645ba2b
-- Type: 21

if mp.HSTR_WEIGHT == 2 and hstrlog[1].hitcount > 3 then
  return mp.INFECTED
end
return mp.CLEAN
