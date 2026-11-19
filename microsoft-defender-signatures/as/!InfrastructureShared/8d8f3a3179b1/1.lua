-- Threat: !InfrastructureShared
-- Name: 8d8f3a3179b1
-- Type: 21

if hstrlog[1].hitcount == 2 and hstrlog[2].hitcount == 1 and hstrlog[3].hitcount == 1 and hstrlog[4].hitcount == 2 and hstrlog[5].hitcount == 1 then
  return mp.INFECTED
end
return mp.CLEAN
