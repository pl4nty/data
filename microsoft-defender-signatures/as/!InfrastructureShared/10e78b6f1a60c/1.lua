-- Threat: !InfrastructureShared
-- Name: 10e78b6f1a60c
-- Type: 21

function map_read(l_1_0, l_1_1)
  local l_1_2 = pe.mmap_va_nofastfail(l_1_0, l_1_1)
  
  if l_1_2 == "" then
    l_1_2 = mp.readfile(pe.foffset_va(l_1_0), l_1_1)
  end
  return l_1_2
end

function search_const(l_2_0, l_2_1, l_2_2)
  local l_2_3 = mp.readfile(pe.foffset_va(l_2_0), l_2_1)
  local l_2_4 = string.find(l_2_3, "\199E" .. string.char(l_2_2), 1, true)
  if l_2_4 ~= nil then
    return mp.readu_u32(l_2_3, l_2_4 + 3)
  end
  return nil
end

function search_const_32(l_3_0, l_3_1, l_3_2)
  local l_3_3 = mp.readfile(pe.foffset_va(l_3_0), l_3_1)
  local l_3_4 = string.find(l_3_3, "\199\133" .. string.char(mp.bitand(l_3_2, 255)) .. string.char(mp.bitand(mp.shr32(l_3_2, 8), 255)), 1, true)
  if l_3_4 ~= nil then
    return mp.readu_u32(l_3_3, l_3_4 + 6)
  end
  return nil
end

function search_const_32_esp(l_4_0, l_4_1, l_4_2)
  local l_4_3
  local l_4_4 = map_read(l_4_0, l_4_1)
  local l_4_5 = string.find(l_4_4, "\199\132$" .. string.char(mp.bitand(l_4_2, 255)) .. string.char(mp.bitand(mp.shr32(l_4_2, 8), 255)), 1, true)
  for l_4_6 = 1, 10 do
    if l_4_5 ~= nil then
      l_4_3 = mp.readu_u32(l_4_4, l_4_5 + 7)
      if 11 < l_4_1 - l_4_5 - 11 then
        l_4_4 = map_read(l_4_0 + l_4_5 + 11, l_4_1 - l_4_5 - 11)
        l_4_5 = string.find(l_4_4, "\199\132$" .. string.char(mp.bitand(l_4_2, 255)) .. string.char(mp.bitand(mp.shr32(l_4_2, 8), 255)), 1, true)
      else
        break
      end
    else
      break
    end
  end
  return l_4_3
end

mp.readprotection(false)
if hstrlog[1].matched then
  local l_0_0 = hstrlog[1].VA
  local l_0_1 = string.byte(mp.readfile(pe.foffset_va(l_0_0 - 5), 1), 1)
  local l_0_2 = string.byte(mp.readfile(pe.foffset_va(l_0_0 - 3), 1), 1)
  local l_0_3 = string.byte(mp.readfile(pe.foffset_va(l_0_0 - 1), 1), 1)
  local l_0_4 = search_const(l_0_0 - 256, 256, l_0_1)
  if l_0_4 ~= nil then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
    mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, mp.bitand(l_0_3 - mp.bitand(mp.bitxor(l_0_2, l_0_4), 255), 255)))
  end
elseif hstrlog[2].matched then
  local l_0_5 = hstrlog[2].VA
  local l_0_6 = string.byte(mp.readfile(pe.foffset_va(l_0_5 - 15), 1), 1)
  local l_0_7 = string.byte(mp.readfile(pe.foffset_va(l_0_5 - 13), 1), 1)
  local l_0_8 = string.byte(mp.readfile(pe.foffset_va(l_0_5 - 8), 1), 1)
  local l_0_9 = search_const(l_0_5 - 256, 256, l_0_6)
  if l_0_9 ~= nil then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
    mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, mp.bitand(-(l_0_8 + mp.bitand(mp.bitxor(l_0_7, l_0_9), 255)), 255)))
  end
elseif hstrlog[3].matched then
  local l_0_10 = hstrlog[3].VA
  local l_0_11 = mp.readu_u32(mp.readfile(pe.foffset_va(l_0_10 - 20), 4), 1)
  local l_0_12 = string.byte(mp.readfile(pe.foffset_va(l_0_10 - 15), 1), 1)
  local l_0_13 = string.byte(mp.readfile(pe.foffset_va(l_0_10 - 10), 1), 1)
  local l_0_14 = search_const_32(l_0_10 - 512, 512, l_0_11)
  if l_0_14 ~= nil then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
    mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, mp.bitand(-(l_0_13 + mp.bitand(mp.bitxor(l_0_12, l_0_14), 255)), 255)))
  end
elseif hstrlog[4].matched then
  local l_0_15 = hstrlog[4].VA
  local l_0_16 = string.byte(mp.readfile(pe.foffset_va(l_0_15 - 6), 1), 1)
  local l_0_17 = string.byte(mp.readfile(pe.foffset_va(l_0_15 - 3), 1), 1)
  local l_0_18 = string.byte(mp.readfile(pe.foffset_va(l_0_15 - 1), 1), 1)
  local l_0_19 = search_const(l_0_15 - 512, 512, l_0_16)
  if l_0_19 ~= nil then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
    mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, mp.bitand(l_0_18 - mp.bitand(mp.bitxor(l_0_17, l_0_19), 255), 255)))
  end
elseif hstrlog[5].matched then
  local l_0_20 = hstrlog[5].VA
  local l_0_21 = string.byte(mp.readfile(pe.foffset_va(l_0_20 - 9), 1), 1)
  local l_0_22 = string.byte(mp.readfile(pe.foffset_va(l_0_20 - 3), 1), 1)
  local l_0_23 = string.byte(mp.readfile(pe.foffset_va(l_0_20 - 1), 1), 1)
  local l_0_24 = search_const(l_0_20 - 768, 768, l_0_21)
  if l_0_24 ~= nil then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
    mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, mp.bitand(l_0_23 - mp.bitand(mp.bitxor(l_0_22, l_0_24), 255), 255)))
  end
elseif hstrlog[6].matched then
  local l_0_25 = hstrlog[6].VA
  local l_0_26 = string.byte(mp.readfile(pe.foffset_va(l_0_25 - 5), 1), 1)
  local l_0_27 = string.byte(mp.readfile(pe.foffset_va(l_0_25 - 3), 1), 1)
  local l_0_28 = string.byte(mp.readfile(pe.foffset_va(l_0_25 - 1), 1), 1)
  local l_0_29 = search_const(l_0_25 - 1024, 1024, l_0_26)
  if l_0_29 ~= nil then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
    mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, mp.bitand(l_0_28 - mp.bitand(mp.bitxor(l_0_27, l_0_29), 255), 255)))
  end
elseif hstrlog[7].matched then
  local l_0_30 = hstrlog[7].VA
  local l_0_31 = mp.readu_u32(map_read(l_0_30 - 16, 4), 1)
  local l_0_32 = string.byte(map_read(l_0_30 - 3, 1), 1)
  local l_0_33 = string.byte(map_read(l_0_30 - 1, 1), 1)
  local l_0_34 = search_const_32_esp(l_0_30 - 1024, 1024, l_0_31)
  if l_0_34 ~= nil then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
    mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, mp.bitand(l_0_33 - mp.bitand(mp.bitxor(l_0_32, l_0_34), 255), 255)))
  end
elseif hstrlog[8].matched then
  local l_0_35 = hstrlog[8].VA
  local l_0_36 = mp.readu_u32(map_read(l_0_35 - 13, 4), 1)
  local l_0_37 = string.byte(map_read(l_0_35 - 3, 1), 1)
  local l_0_38 = string.byte(map_read(l_0_35 - 1, 1), 1)
  local l_0_39 = search_const_32_esp(l_0_35 - 1024, 1024, l_0_36)
  if l_0_39 ~= nil then
    mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
    mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, mp.bitand(l_0_38 - mp.bitand(mp.bitxor(l_0_37, l_0_39), 255), 255)))
  end
end
return mp.CLEAN
