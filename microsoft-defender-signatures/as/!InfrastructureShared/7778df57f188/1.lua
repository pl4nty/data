-- Threat: !InfrastructureShared
-- Name: 7778df57f188
-- Type: 21

mp.readprotection(false)
if hstrlog[1].matched then
  local l_0_0 = mp.readfile(pe.foffset_va(hstrlog[1].VA + 6), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", mp.bitand(-string.byte(l_0_0), 255), 1))
elseif hstrlog[2].matched then
  local l_0_1 = mp.readfile(pe.foffset_va(hstrlog[2].VA + 32), 1)
  local l_0_2 = mp.readfile(pe.foffset_va(hstrlog[2].VA), 4)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", mp.bitand(-string.byte(l_0_1), 255), 1))
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!l1_cnt_%08X", mp.readu_u32(l_0_2, 1)))
elseif hstrlog[3].matched then
  local l_0_3 = mp.readfile(pe.foffset_va(hstrlog[3].VA + 5), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", mp.bitand(-string.byte(l_0_3), 255), 1))
end
return mp.INFECTED
