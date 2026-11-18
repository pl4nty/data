-- Threat: !InfrastructureShared
-- Name: b278d5028a45
-- Type: 21

mp.readprotection(false)
if hstrlog[1].matched then
  local l_0_0 = mp.readfile(pe.foffset_va(hstrlog[1].VA + 11), 4)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!l1_cnt_%08X", mp.readu_u32(l_0_0, 1)))
elseif hstrlog[2].matched then
  local l_0_1 = mp.readfile(pe.foffset_va(hstrlog[2].VA - 7), 4)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!l1_cnt_%08X", mp.readu_u32(l_0_1, 1)))
elseif hstrlog[3].matched or hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched or hstrlog[9].matched then
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!l1_cnt_%08X", 4097))
elseif hstrlog[4].matched then
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!l1_cnt_%08X", 4096))
end
return mp.CLEAN
