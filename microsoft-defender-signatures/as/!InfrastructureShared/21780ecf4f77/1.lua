-- Threat: !InfrastructureShared
-- Name: 21780ecf4f77
-- Type: 21

if hstrlog[1].matched then
  local l_0_0 = pe.mmap_va_nofastfail(hstrlog[1].VA + 4, 4)
  local l_0_1 = pe.mmap_va_nofastfail(hstrlog[1].VA + 9, 4)
  mp.set_mpattribute(string.format("HSTR:Obfuscator.PN!crc_key.2_%02X%02X%02X%02X_%02X%02X%02X%02X", string.byte(l_0_0, 4), string.byte(l_0_0, 3), string.byte(l_0_0, 2), string.byte(l_0_0, 1), string.byte(l_0_1, 4), string.byte(l_0_1, 3), string.byte(l_0_1, 2), string.byte(l_0_1, 1)))
end
return mp.CLEAN
