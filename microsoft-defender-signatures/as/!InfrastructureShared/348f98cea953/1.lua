-- Threat: !InfrastructureShared
-- Name: 348f98cea953
-- Type: 21

if hstrlog[1].hitcount == 1 or hstrlog[2].hitcount == 1 or hstrlog[3].hitcount == 1 or hstrlog[4].hitcount == 1 then
  return mp.INFECTED
end
return mp.CLEAN
