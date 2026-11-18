-- Threat: !InfrastructureShared
-- Name: 10078b481a907
-- Type: 21

mp.readprotection(false)
if hstrlog[1].matched then
  local l_0_0 = mp.readfile(pe.foffset_va(hstrlog[1].VA + 14), 1)
  local l_0_1 = mp.readfile(pe.foffset_va(hstrlog[1].VA + 17), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", string.byte(l_0_0), string.byte(l_0_1)))
elseif hstrlog[2].matched then
  local l_0_2 = mp.readfile(pe.foffset_va(hstrlog[2].VA + 6), 1)
  local l_0_3 = mp.readfile(pe.foffset_va(hstrlog[2].VA + 14), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", string.byte(l_0_2), string.byte(l_0_3)))
elseif hstrlog[3].matched then
  local l_0_4 = mp.readfile(pe.foffset_va(hstrlog[3].VA + 4), 1)
  local l_0_5 = mp.readfile(pe.foffset_va(hstrlog[3].VA + 12), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", string.byte(l_0_4), string.byte(l_0_5)))
elseif hstrlog[4].matched then
  local l_0_6 = mp.readfile(pe.foffset_va(hstrlog[4].VA + 6), 1)
  local l_0_7 = mp.readfile(pe.foffset_va(hstrlog[4].VA + 14), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", string.byte(l_0_6), string.byte(l_0_7)))
elseif hstrlog[5].matched then
  local l_0_8 = mp.readfile(pe.foffset_va(hstrlog[5].VA - 1), 1)
  local l_0_9 = mp.readfile(pe.foffset_va(hstrlog[5].VA + 11), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", string.byte(l_0_8), string.byte(l_0_9)))
elseif hstrlog[6].matched then
  local l_0_10 = mp.readfile(pe.foffset_va(hstrlog[6].VA + 9), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", string.byte(l_0_10), 6))
elseif hstrlog[7].matched then
  local l_0_11 = mp.readfile(pe.foffset_va(hstrlog[7].VA + 9), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k1_k2.0_%02X%02X", string.byte(l_0_11), 6))
end
return mp.INFECTED
