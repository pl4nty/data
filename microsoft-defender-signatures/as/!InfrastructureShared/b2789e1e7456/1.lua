-- Threat: !InfrastructureShared
-- Name: b2789e1e7456
-- Type: 21

if mp.HSTR_WEIGHT >= 21
  and hstrlog[3].hitcount + hstrlog[4].hitcount + hstrlog[5].hitcount + hstrlog[6].hitcount >= 5 then
  return mp.INFECTED
end
return mp.LOWFI
