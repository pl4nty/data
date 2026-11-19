-- Threat: !InfrastructureShared
-- Name: 13e78ea4c11cc
-- Type: 21

if hstrlog[2].hitcount == 0 and hstrlog[3].hitcount == 0 then
  return mp.CLEAN
end
if hstrlog[4].hitcount == 0 and hstrlog[5].hitcount == 0 and hstrlog[6].hitcount == 0 then
  return mp.CLEAN
end
return mp.INFECTED
