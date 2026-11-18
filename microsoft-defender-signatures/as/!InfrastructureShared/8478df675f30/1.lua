-- Threat: !InfrastructureShared
-- Name: 8478df675f30
-- Type: 21

if mp.get_mpattribute("SIGATTR:AntiEmuRaceThread") and hstrlog[1].matched then
  local l_0_0 = 0
  local l_0_1 = mp.hstr_full_log()
  for l_0_2, l_0_3 in pairs(l_0_1) do
    if l_0_3.matched and l_0_2 ~= "filter1" then
      l_0_0 = l_0_3.VA
    end
  end
  if l_0_0 == 0 then
    return mp.CLEAN
  end
  local l_0_4 = l_0_0 - pehdr.AddressOfEntryPoint
  if l_0_4 < 48 and -48 < l_0_4 then
    return mp.CLEAN
  end
  local l_0_5 = pe.mmap_va(pehdr.AddressOfEntryPoint + pehdr.ImageBase, 16)
  local l_0_6 = mp.readu_u32(l_0_5, 1)
  if mp.bitand(l_0_6, 16777215) ~= 15204458 then
    return mp.CLEAN
  end
  local l_0_7 = l_0_0 - pehdr.AddressOfEntryPoint - 7 - pehdr.ImageBase
  mp.readprotection(false)
  local l_0_8 = mp.readfile(0, mp.getfilesize())
  mp.writeu_u32(l_0_8, pe.foffset_rva(pehdr.AddressOfEntryPoint + 1), 15326001)
  mp.writeu_u32(l_0_8, pe.foffset_rva(pehdr.AddressOfEntryPoint + 4), l_0_7)
  mp.vfo_add_buffer(l_0_8, "[Obfuscator.AKH0]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  mp.set_mpattribute("HSTR:PatchAntiEmuRaceThread")
end
return mp.CLEAN
