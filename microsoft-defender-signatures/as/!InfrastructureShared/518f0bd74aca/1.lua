-- Threat: !InfrastructureShared
-- Name: 518f0bd74aca
-- Type: 21

if hstrlog[2].hitcount >= 10 then
  return mp.INFECTED
end
return mp.CLEAN
