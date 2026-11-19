-- Threat: !InfrastructureShared
-- Name: 2e78d0a53169
-- Type: 21

if pehdr.DataDirectory[1].Size < 256 then
  return mp.INFECTED
end
return mp.CLEAN
