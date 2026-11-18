-- Threat: !InfrastructureShared
-- Name: 6978b494eb91
-- Type: 21

if hstrlog[1].hitcount > 2 then
  return mp.INFECTED
end
return mp.CLEAN
