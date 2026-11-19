-- Threat: !InfrastructureShared
-- Name: 47782e9fcde6
-- Type: 21
-- Flags: 1

if hstrlog[3].hitcount >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
