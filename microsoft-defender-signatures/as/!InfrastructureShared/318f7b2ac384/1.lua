-- Threat: !InfrastructureShared
-- Name: 318f7b2ac384
-- Type: 21

if hstrlog[2].hitcount > 50 and 50 < hstrlog[3].hitcount then
  return mp.INFECTED
end
return mp.CLEAN
