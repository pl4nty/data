-- Threat: !InfrastructureShared
-- Name: 228f17b3b147
-- Type: 21

if hstrlog[1].hitcount == 1 or hstrlog[2].hitcount == 1 then
  return mp.INFECTED
end
return mp.CLEAN
