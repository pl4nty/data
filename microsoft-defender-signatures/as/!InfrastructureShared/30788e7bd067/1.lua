-- Threat: !InfrastructureShared
-- Name: 30788e7bd067
-- Type: 21

if mp.HSTR_WEIGHT == 3 and hstrlog[3].hitcount > 5 then
  return mp.INFECTED
end
return mp.CLEAN
