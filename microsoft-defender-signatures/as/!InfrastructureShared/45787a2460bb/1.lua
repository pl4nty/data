-- Threat: !InfrastructureShared
-- Name: 45787a2460bb
-- Type: 21

if hstrlog[2].hitcount > 3 then
  return mp.INFECTED
end
return mp.CLEAN
