-- Threat: !InfrastructureShared
-- Name: 6f78727d2e50
-- Type: 21
-- Flags: 1

if hstrlog[1].VA >= 0 + pehdr.ImageBase and hstrlog[1].VA <= 30000 + pehdr.ImageBase and hstrlog[2].VA >= 0 + pehdr.ImageBase and hstrlog[2].VA <= 30000 + pehdr.ImageBase then
  return mp.INFECTED
end
return mp.CLEAN
