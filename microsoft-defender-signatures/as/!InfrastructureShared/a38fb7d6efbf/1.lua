-- Threat: !InfrastructureShared
-- Name: a38fb7d6efbf
-- Type: 21

if hstrlog[1].hitcount == 1 and hstrlog[2].hitcount == 1 and hstrlog[3].hitcount == 1 and hstrlog[4].hitcount == 1 and hstrlog[5].hitcount == 2 and hstrlog[6].hitcount == 1 then
  return mp.INFECTED
end
return mp.CLEAN
