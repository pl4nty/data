-- Threat: !InfrastructureShared
-- Name: 1f78f49e0159
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and hstrlog[2].VA >= hstrlog[1].VA + pehdr.ImageBase and hstrlog[2].VA <= hstrlog[1].VA + 100 + pehdr.ImageBase then
  return mp.INFECTED
end
return mp.CLEAN
