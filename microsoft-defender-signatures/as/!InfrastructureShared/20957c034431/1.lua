-- Threat: !InfrastructureShared
-- Name: 20957c034431
-- Type: 21

if pevars.sigaddr ~= pehdr.ImageBase + pehdr.AddressOfEntryPoint then
  return mp.CLEAN
end
local l_0_0 = pe.mmap_va(pevars.sigaddr + 10, 1)
if mp.bitand(string.byte(l_0_0, 1), 128) == 0 then
  return mp.CLEAN
end
return mp.INFECTED
