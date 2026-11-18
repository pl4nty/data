-- Threat: !InfrastructureShared
-- Name: 1b8925610229
-- Type: 21

if pevars.sigaddr == pehdr.ImageBase + pehdr.AddressOfEntryPoint then
  local l_0_0 = pe.get_api_id(mp.readu_u32(pe.mmap_va(mp.readu_u32(pe.mmap_va(pevars.sigaddr + 18, 4), 1), 4), 1))
  local l_0_1 = pe.get_api_id(mp.readu_u32(pe.mmap_va(mp.readu_u32(pe.mmap_va(pevars.sigaddr + 24, 4), 1), 4), 1))
  if l_0_0 == 1467596470 and l_0_1 == 3909456120 then
    return mp.INFECTED
  end
end
return mp.CLEAN
