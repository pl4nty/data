-- Threat: !InfrastructureShared
-- Name: c08fe87864f3
-- Type: 21

if hstrlog[4].hitcount >= 20 then
  return mp.INFECTED
end
return mp.CLEAN
