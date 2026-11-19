-- Threat: !InfrastructureShared
-- Name: 977847bbd54f
-- Type: 21

if hstrlog[2].VA < pehdr.ImageBase + pesecs[1].VirtualAddress + 240 and hstrlog[1].VA + 10704 < pehdr.ImageBase + pehdr.AddressOfEntryPoint then
  return mp.SUSPICIOUS
end
return mp.CLEAN
