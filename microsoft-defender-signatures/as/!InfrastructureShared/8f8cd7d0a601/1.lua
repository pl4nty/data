-- Threat: !InfrastructureShared
-- Name: 8f8cd7d0a601
-- Type: 21
-- Flags: 1

if hstrlog[1].VA < hstrlog[2].VA then
  return mp.INFECTED
end
return mp.CLEAN
