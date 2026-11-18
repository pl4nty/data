-- Threat: !InfrastructureShared
-- Name: f678b45a129b
-- Type: 21

mp.readprotection(false)
if hstrlog[1].matched then
  local l_0_0 = mp.readfile(pe.foffset_va(hstrlog[1].VA + 8), 1)
  local l_0_1 = mp.readfile(pe.foffset_va(hstrlog[1].VA + 11), 1)
  local l_0_2 = mp.readfile(pe.foffset_va(hstrlog[1].VA + 14), 1)
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k3.0_%02X", string.byte(l_0_0)))
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_1), string.byte(l_0_2)))
elseif hstrlog[2].matched then
  local l_0_3 = mp.readfile(pe.foffset_va(hstrlog[2].VA + 8), 1)
  local l_0_4 = mp.readfile(pe.foffset_va(hstrlog[2].VA + 11), 1)
  local l_0_5 = mp.readfile(pe.foffset_va(hstrlog[2].VA + 14), 1)
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k3.0_%02X", string.byte(l_0_3)))
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_4), mp.bitand(-string.byte(l_0_5), 255)))
elseif hstrlog[3].matched then
  local l_0_6 = mp.readfile(pe.foffset_va(hstrlog[3].VA + 8), 1)
  local l_0_7 = mp.readfile(pe.foffset_va(hstrlog[3].VA + 11), 1)
  local l_0_8 = mp.readfile(pe.foffset_va(hstrlog[3].VA + 14), 1)
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k3.0_%02X", string.byte(l_0_6)))
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_7), mp.bitand(-string.byte(l_0_8), 255)))
elseif hstrlog[4].matched then
  local l_0_9 = mp.readfile(pe.foffset_va(hstrlog[4].VA + 8), 1)
  local l_0_10 = mp.readfile(pe.foffset_va(hstrlog[4].VA + 11), 1)
  local l_0_11 = mp.readfile(pe.foffset_va(hstrlog[4].VA + 14), 1)
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k3.0_%02X", mp.bitand(-string.byte(l_0_9), 255)))
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_10), mp.bitand(-string.byte(l_0_11), 255)))
elseif hstrlog[5].matched then
  local l_0_12 = mp.readfile(pe.foffset_va(hstrlog[5].VA + 6), 1)
  local l_0_13 = mp.readfile(pe.foffset_va(hstrlog[5].VA + 12), 1)
  local l_0_14 = mp.readfile(pe.foffset_va(hstrlog[5].VA + 18), 1)
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k3.0_%02X", string.byte(l_0_12)))
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_13), string.byte(l_0_14)))
elseif hstrlog[6].matched then
  local l_0_15 = mp.readfile(pe.foffset_va(hstrlog[6].VA + 6), 1)
  local l_0_16 = mp.readfile(pe.foffset_va(hstrlog[6].VA + 9), 1)
  local l_0_17 = mp.readfile(pe.foffset_va(hstrlog[6].VA + 12), 1)
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k3.0_%02X", string.byte(l_0_15)))
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_16), string.byte(l_0_17)))
elseif hstrlog[7].matched then
  local l_0_18 = mp.readfile(pe.foffset_va(hstrlog[7].VA + 6), 1)
  local l_0_19 = mp.readfile(pe.foffset_va(hstrlog[7].VA + 9), 1)
  local l_0_20 = mp.readfile(pe.foffset_va(hstrlog[7].VA + 12), 1)
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k3.0_%02X", string.byte(l_0_18)))
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_19), string.byte(l_0_20)))
elseif hstrlog[8].matched then
  local l_0_21 = mp.readfile(pe.foffset_va(hstrlog[8].VA + hstrlog[8].match_offsets[2]), 1)
  local l_0_22 = mp.readfile(pe.foffset_va(hstrlog[8].VA + hstrlog[8].match_offsets[3]), 1)
  local l_0_23 = mp.readfile(pe.foffset_va(hstrlog[8].VA + hstrlog[8].match_offsets[4]), 1)
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k3.0_%02X", string.byte(l_0_21)))
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_22), string.byte(l_0_23)))
end
return mp.INFECTED
