-- Threat: !InfrastructureShared
-- Name: ab78632f39f8
-- Type: 21

if hstrlog[1].hitcount == 0 and hstrlog[2].hitcount == 0 then
  return mp.LOWFI
end
if hstrlog[3].hitcount == 0 and hstrlog[4].hitcount == 0 then
  return mp.LOWFI
end
if hstrlog[5].hitcount == 0 then
  return mp.LOWFI
end
if peattributes.ismsil then
  return mp.INFECTED
end
return mp.LOWFI
