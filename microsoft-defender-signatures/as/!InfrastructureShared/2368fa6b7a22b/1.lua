-- Threat: !InfrastructureShared
-- Name: 2368fa6b7a22b
-- Type: 21

if hstrlog[1].hitcount == 0 and hstrlog[2].hitcount == 0 and hstrlog[3].hitcount == 0 and hstrlog[4].hitcount == 0 and hstrlog[5].hitcount == 0 and hstrlog[6] == 0 then
  return mp.LOWFI
end
if hstrlog[7].hitcount == 0 and hstrlog[8].hitcount == 0 and hstrlog[9].hitcount == 0 and hstrlog[10].hitcount == 0 and hstrlog[11] == 0 and hstrlog[12] == 0 then
  return mp.LOWFI
end
return mp.INFECTED
