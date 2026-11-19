-- Threat: !InfrastructureShared
-- Name: 55613b55bcad
-- Type: 21

if hstrlog[1].hitcount >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
