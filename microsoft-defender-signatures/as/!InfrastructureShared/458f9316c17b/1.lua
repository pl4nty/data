-- Threat: !InfrastructureShared
-- Name: 458f9316c17b
-- Type: 21

if hstrlog[1].hitcount == 1 or hstrlog[2].hitcount == 1 or hstrlog[3].hitcount == 1 or hstrlog[4].hitcount == 1 or hstrlog[5].hitcount == 1 or hstrlog[6].hitcount == 1 then
  return mp.INFECTED
end
return mp.CLEAN
