-- Threat: !InfrastructureShared
-- Name: 7078f61f24c0
-- Type: 21

if mp.HSTR_WEIGHT == 5 and hstrlog[5].hitcount > 3 then
  return mp.INFECTED
end
return mp.CLEAN
