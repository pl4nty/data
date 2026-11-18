-- Threat: !InfrastructureShared
-- Name: 7578aac9539e
-- Type: 21

if hstrlog[1].hitcount >= 3 and (hstrlog[2].hitcount >= 4 or hstrlog[3].hitcount >= 4) then
  return mp.INFECTED
end
return mp.LOWFI
