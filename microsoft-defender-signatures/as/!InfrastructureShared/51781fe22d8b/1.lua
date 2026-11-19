-- Threat: !InfrastructureShared
-- Name: 51781fe22d8b
-- Type: 21

if hstrlog[1].hitcount + hstrlog[2].hitcount + hstrlog[3].hitcount + hstrlog[4].hitcount >= 5 then
  return mp.INFECTED
end
return mp.CLEAN
