-- Threat: !InfrastructureShared
-- Name: 1ac8fdfae086d
-- Type: 21

if hstrlog[10].hitcount >= 10 then
  return mp.INFECTED
end
return mp.CLEAN
