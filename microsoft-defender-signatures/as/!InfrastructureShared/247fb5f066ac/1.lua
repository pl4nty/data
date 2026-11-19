-- Threat: !InfrastructureShared
-- Name: 247fb5f066ac
-- Type: 21

if pevars.sigaddr == pehdr.ImageBase + pehdr.AddressOfEntryPoint then
  return mp.INFECTED
end
return mp.CLEAN
