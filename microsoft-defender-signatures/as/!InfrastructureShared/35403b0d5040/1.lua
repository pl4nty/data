-- Threat: !InfrastructureShared
-- Name: 35403b0d5040
-- Type: 21

if pesecs[1].VirtualSize > 20480 and pesecs[1].VirtualAddress == 4096 then
  return mp.INFECTED
end
return mp.CLEAN
