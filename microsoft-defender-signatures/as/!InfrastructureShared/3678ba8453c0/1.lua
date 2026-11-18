-- Threat: !InfrastructureShared
-- Name: 3678ba8453c0
-- Type: 21

if pehdr.DataDirectory[1].Size < 256 then
  return mp.INFECTED
end
return mp.CLEAN
