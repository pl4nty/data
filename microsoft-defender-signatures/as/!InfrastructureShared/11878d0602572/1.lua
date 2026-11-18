-- Threat: !InfrastructureShared
-- Name: 11878d0602572
-- Type: 21

if hstrlog[2].hitcount == 0 and hstrlog[3].hitcount == 0 and hstrlog[4].hitcount == 0 and hstrlog[5].hitcount == 0 then
  return mp.CLEAN
end
if hstrlog[6].hitcount == 0 and hstrlog[7].hitcount == 0 and hstrlog[8].hitcount == 0 and hstrlog[9].hitcount == 0 then
  return mp.CLEAN
end
if hstrlog[10].hitcount == 0 and hstrlog[11].hitcount == 0 and hstrlog[12].hitcount == 0 then
  return mp.CLEAN
end
if hstrlog[13].hitcount == 0 and hstrlog[14].hitcount == 0 then
  return mp.CLEAN
end
return mp.INFECTED
