-- Threat: !InfrastructureShared
-- Name: 8978411aa98c
-- Type: 21

if pehdr.DataDirectory[1].Size < 256 then
  return mp.INFECTED
end
return mp.CLEAN
