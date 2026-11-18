-- Threat: !InfrastructureShared
-- Name: 1b7785414e0b4
-- Type: 21

mp.readprotection(false)
if hstrlog[3].matched then
  local l_0_0 = mp.readfile(pe.foffset_va(hstrlog[3].VA + 4), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k1_%08X_%02X", mp.readu_u32(l_0_0, 1), 2))
elseif hstrlog[4].matched then
  local l_0_1 = mp.readfile(pe.foffset_va(hstrlog[4].VA + 6), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k1_%08X_%02X", mp.readu_u32(l_0_1, 1), 2))
elseif hstrlog[5].matched then
  local l_0_2 = mp.readfile(pe.foffset_va(hstrlog[5].VA - 4), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k1_%08X_%02X", mp.readu_u32(l_0_2, 1), 2))
elseif hstrlog[6].matched then
  local l_0_3 = mp.readfile(pe.foffset_va(hstrlog[6].VA - 15), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k1_%08X_%02X", mp.readu_u32(l_0_3, 1), 2))
elseif hstrlog[1].matched then
  local l_0_4 = mp.readfile(pe.foffset_va(hstrlog[1].VA - 4), 4)
  local l_0_5 = mp.readfile(pe.foffset_va(hstrlog[1].VA + 4), 1)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k1_%08X_%02X", mp.readu_u32(l_0_4, 1), string.byte(l_0_5, 1)))
elseif hstrlog[2].matched then
  local l_0_6 = mp.readfile(pe.foffset_va(hstrlog[2].VA - 4), 4)
  local l_0_7 = mp.readfile(pe.foffset_va(hstrlog[2].VA + 4), 1)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k1_%08X_%02X", mp.readu_u32(l_0_6, 1), string.byte(l_0_7, 1)))
end
if hstrlog[7].matched then
  local l_0_8 = pe.mmap_va_nofastfail(hstrlog[7].VA + 5, 4)
  if l_0_8 == "" then
    l_0_8 = mp.readfile(pe.foffset_va(hstrlog[7].VA + 5), 4)
  end
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_8, 1)))
elseif hstrlog[8].matched then
  local l_0_9 = mp.readfile(pe.foffset_va(hstrlog[8].VA + 7), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_9, 1)))
elseif hstrlog[9].matched then
  local l_0_10 = mp.readfile(pe.foffset_va(hstrlog[9].VA + 5), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_10, 1)))
elseif hstrlog[10].matched then
  local l_0_11 = mp.readfile(pe.foffset_va(hstrlog[10].VA + 5), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_11, 1)))
elseif hstrlog[11].matched then
  local l_0_12 = mp.readfile(pe.foffset_va(hstrlog[11].VA + 9), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_12, 1)))
elseif hstrlog[12].matched then
  local l_0_13 = mp.readfile(pe.foffset_va(hstrlog[12].VA + 5), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_13, 1)))
elseif hstrlog[13].matched then
  local l_0_14 = mp.readfile(pe.foffset_va(hstrlog[13].VA + 7), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_14, 1)))
elseif hstrlog[14].matched then
  local l_0_15 = mp.readfile(pe.foffset_va(hstrlog[14].VA - 7), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_15, 1)))
elseif hstrlog[15].matched then
  local l_0_16 = mp.readfile(pe.foffset_va(hstrlog[15].VA - 7), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_16, 1)))
elseif hstrlog[16].matched then
  local l_0_17 = mp.readfile(pe.foffset_va(hstrlog[16].VA - 4), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_17, 1)))
elseif hstrlog[17].matched then
  local l_0_18 = mp.readfile(pe.foffset_va(hstrlog[17].VA - 4), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_18, 1)))
elseif hstrlog[18].matched then
  local l_0_19 = mp.readfile(pe.foffset_va(hstrlog[18].VA - 4), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_19, 1)))
elseif hstrlog[19].matched then
  local l_0_20 = mp.readfile(pe.foffset_va(hstrlog[19].VA - 7), 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.7_k2_%08X", mp.readu_u32(l_0_20, 1)))
end
return mp.CLEAN
