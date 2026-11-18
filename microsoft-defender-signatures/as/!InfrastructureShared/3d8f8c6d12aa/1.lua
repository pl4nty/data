-- Threat: !InfrastructureShared
-- Name: 3d8f8c6d12aa
-- Type: 21

if hstrlog[2].hitcount > 6 then
  return mp.INFECTED
end
return mp.CLEAN
