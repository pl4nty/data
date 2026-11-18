-- Threat: !InfrastructureShared
-- Name: e4781c5d67c6
-- Type: 21

if hstrlog[1].hitcount > 0 and 0 < hstrlog[2].hitcount and mp.HSTR_WEIGHT == 4 then
  return mp.CLEAN
end
if 0 < hstrlog[3].hitcount and 0 < hstrlog[4].hitcount and mp.HSTR_WEIGHT == 4 then
  return mp.CLEAN
end
if hstrlog[1].hitcount > 0 and 0 < hstrlog[2].hitcount and 0 < hstrlog[3].hitcount and 0 < hstrlog[4].hitcount and mp.HSTR_WEIGHT == 5 then
  return mp.CLEAN
end
return mp.INFECTED
