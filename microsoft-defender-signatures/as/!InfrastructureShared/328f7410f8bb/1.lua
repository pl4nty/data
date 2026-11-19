-- Threat: !InfrastructureShared
-- Name: 328f7410f8bb
-- Type: 21

if hstrlog[4].hitcount > 45 then
  return mp.INFECTED
end
return mp.CLEAN
