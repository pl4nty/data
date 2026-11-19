-- Threat: !InfrastructureShared
-- Name: 33e787dceabd9
-- Type: 21

if mp.HSTR_WEIGHT == 6 and hstrlog[1].VA + 98 == hstrlog[2].VA and hstrlog[2].VA + 162 == hstrlog[3].VA and hstrlog[3].VA + 160 == hstrlog[4].VA and hstrlog[4].VA + 160 == hstrlog[5].VA and hstrlog[6].hitcount > 23 then
  return mp.INFECTED
end
return mp.CLEAN
