-- Threat: !InfrastructureShared
-- Name: 64785e98543d
-- Type: 21
-- Flags: 1

if mp.getfilesize() <= 300000 and hstrlog[1].VA == 0 + pehdr.ImageBase and hstrlog[2].matched then
  return mp.INFECTED
end
return mp.CLEAN
