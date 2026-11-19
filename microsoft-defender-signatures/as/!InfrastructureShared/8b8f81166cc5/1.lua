-- Threat: !InfrastructureShared
-- Name: 8b8f81166cc5
-- Type: 21

if hstrlog[3].hitcount >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
