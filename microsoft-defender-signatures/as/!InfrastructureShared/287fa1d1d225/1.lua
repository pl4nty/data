-- Threat: !InfrastructureShared
-- Name: 287fa1d1d225
-- Type: 21

if pevars.sigaddr == pehdr.ImageBase + pehdr.AddressOfEntryPoint then
  local l_0_0 = pe.mmap_va(pevars.sigaddr, 48)
  if mp.readu_u32(l_0_0, 18) ~= 0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
