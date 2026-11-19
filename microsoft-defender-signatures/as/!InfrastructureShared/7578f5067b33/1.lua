-- Threat: !InfrastructureShared
-- Name: 7578f5067b33
-- Type: 21

if mp.HSTR_WEIGHT == 2 and 2 < hstrlog[3].hitcount then
  return mp.INFECTED
end
return mp.CLEAN
