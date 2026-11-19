-- Threat: !InfrastructureShared
-- Name: 86178d7df5dbb
-- Type: 21

mp.readprotection(false)
if hstrlog[1].matched then
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_6EF2")
elseif hstrlog[2].matched or hstrlog[4].matched then
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_6FF3")
elseif hstrlog[3].matched then
  local l_0_0 = pe.mmap_va_nofastfail(hstrlog[3].VA + 4, 1)
  local l_0_1 = pe.mmap_va_nofastfail(hstrlog[3].VA + 7, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_0), mp.bitand(-string.byte(l_0_1), 255)))
elseif hstrlog[5].matched then
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_3CBE")
elseif hstrlog[6].matched then
  local l_0_2 = pe.mmap_va_nofastfail(hstrlog[6].VA + 11, 1)
  local l_0_3 = pe.mmap_va_nofastfail(hstrlog[6].VA + 14, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_2), mp.bitand(-string.byte(l_0_3), 255)))
elseif hstrlog[7].matched then
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_73F7")
elseif hstrlog[8].matched then
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_74F8")
elseif hstrlog[9].matched then
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_77FB")
elseif hstrlog[10].matched then
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_C3B2")
elseif hstrlog[11].matched then
  local l_0_4 = pe.mmap_va_nofastfail(hstrlog[11].VA - 3, 1)
  local l_0_5 = pe.mmap_va_nofastfail(hstrlog[11].VA - 1, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_4), mp.bitand(-string.byte(l_0_5), 255)))
elseif hstrlog[12].matched then
  local l_0_6 = pe.mmap_va_nofastfail(hstrlog[12].VA + 4, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_6), 255))
elseif hstrlog[13].matched then
  local l_0_7 = pe.mmap_va_nofastfail(hstrlog[13].VA + 4, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_7), 1))
elseif hstrlog[14].matched then
  local l_0_8 = pe.mmap_va_nofastfail(hstrlog[14].VA + 4, 1)
  local l_0_9 = pe.mmap_va_nofastfail(hstrlog[14].VA + 7, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_8), string.byte(l_0_9)))
elseif hstrlog[15].matched then
  local l_0_10 = pe.mmap_va_nofastfail(hstrlog[15].VA + 4, 1)
  local l_0_11 = pe.mmap_va_nofastfail(hstrlog[15].VA + 7, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_10), string.byte(l_0_11)))
elseif hstrlog[16].matched then
  local l_0_12 = pe.mmap_va_nofastfail(hstrlog[16].VA + 4, 1)
  local l_0_13 = pe.mmap_va_nofastfail(hstrlog[16].VA + 6, 1)
  if l_0_12 == "" or l_0_13 == "" then
    l_0_12 = mp.readfile(pe.foffset_va(hstrlog[16].VA + 4), 1)
    l_0_13 = mp.readfile(pe.foffset_va(hstrlog[16].VA + 6), 1)
  end
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_12), string.byte(l_0_13)))
elseif hstrlog[18].matched then
  local l_0_14 = pe.mmap_va_nofastfail(hstrlog[18].VA + 8, 1)
  local l_0_15 = pe.mmap_va_nofastfail(hstrlog[18].VA + 11, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_14), string.byte(l_0_15)))
elseif hstrlog[19].matched then
  local l_0_16 = pe.mmap_va_nofastfail(hstrlog[19].VA + 10, 1)
  local l_0_17 = pe.mmap_va_nofastfail(hstrlog[19].VA + 12, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_16), string.byte(l_0_17)))
elseif hstrlog[20].matched then
  local l_0_18 = pe.mmap_va_nofastfail(hstrlog[20].VA + 14, 1)
  local l_0_19 = pe.mmap_va_nofastfail(hstrlog[20].VA + 20, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_18), string.byte(l_0_19)))
elseif hstrlog[21].matched then
  local l_0_20 = pe.mmap_va_nofastfail(hstrlog[21].VA + 16, 1)
  local l_0_21 = pe.mmap_va_nofastfail(hstrlog[21].VA + 22, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_20), string.byte(l_0_21)))
elseif hstrlog[22].matched then
  local l_0_22 = pe.mmap_va_nofastfail(hstrlog[22].VA + 13, 1)
  local l_0_23 = pe.mmap_va_nofastfail(hstrlog[22].VA + 16, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_22), string.byte(l_0_23)))
elseif hstrlog[23].matched then
  local l_0_24 = pe.mmap_va_nofastfail(hstrlog[23].VA + 5, 1)
  local l_0_25 = pe.mmap_va_nofastfail(hstrlog[23].VA + 8, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_24), string.byte(l_0_25)))
elseif hstrlog[24].matched then
  local l_0_26 = pe.mmap_va_nofastfail(hstrlog[24].VA + 4, 1)
  local l_0_27 = pe.mmap_va_nofastfail(hstrlog[24].VA + 6, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_26), string.byte(l_0_27)))
elseif hstrlog[25].matched then
  local l_0_28 = pe.mmap_va_nofastfail(hstrlog[25].VA + 4, 1)
  local l_0_29 = pe.mmap_va_nofastfail(hstrlog[25].VA + 19, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_28), string.byte(l_0_29)))
elseif hstrlog[26].matched then
  local l_0_30 = pe.mmap_va_nofastfail(hstrlog[26].VA + 14, 1)
  local l_0_31 = pe.mmap_va_nofastfail(hstrlog[26].VA + 26, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_30), string.byte(l_0_31)))
elseif hstrlog[27].matched then
  local l_0_32 = pe.mmap_va_nofastfail(hstrlog[27].VA + 4, 1)
  local l_0_33 = pe.mmap_va_nofastfail(hstrlog[27].VA + 6, 1)
  if l_0_32 == "" or l_0_33 == "" then
    l_0_32 = mp.readfile(pe.foffset_va(hstrlog[27].VA + 4), 1)
    l_0_33 = mp.readfile(pe.foffset_va(hstrlog[27].VA + 6), 1)
  end
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_32), string.byte(l_0_33)))
elseif hstrlog[28].matched then
  local l_0_34 = pe.mmap_va_nofastfail(hstrlog[28].VA + 4, 1)
  local l_0_35 = pe.mmap_va_nofastfail(hstrlog[28].VA + 9, 1)
  if l_0_34 == "" or l_0_35 == "" then
    l_0_34 = mp.readfile(pe.foffset_va(hstrlog[28].VA + 4), 1)
    l_0_35 = mp.readfile(pe.foffset_va(hstrlog[28].VA + 9), 1)
  end
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_34), string.byte(l_0_35)))
elseif hstrlog[29].matched then
  local l_0_36 = pe.mmap_va_nofastfail(hstrlog[29].VA + 14, 1)
  local l_0_37 = pe.mmap_va_nofastfail(hstrlog[29].VA + 26, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_36), string.byte(l_0_37)))
elseif hstrlog[30].matched then
  local l_0_38 = pe.mmap_va_nofastfail(hstrlog[30].VA + 4, 1)
  local l_0_39 = pe.mmap_va_nofastfail(hstrlog[30].VA + 6, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_38), string.byte(l_0_39)))
elseif hstrlog[31].matched then
  local l_0_40 = pe.mmap_va_nofastfail(hstrlog[31].VA + 11, 1)
  local l_0_41 = pe.mmap_va_nofastfail(hstrlog[31].VA + 13, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_40), string.byte(l_0_41)))
elseif hstrlog[32].matched then
  local l_0_42 = pe.mmap_va_nofastfail(hstrlog[32].VA + 4, 1)
  local l_0_43 = pe.mmap_va_nofastfail(hstrlog[32].VA + 9, 1)
  if l_0_42 == "" or l_0_43 == "" then
    l_0_42 = mp.readfile(pe.foffset_va(hstrlog[32].VA + 4), 1)
    l_0_43 = mp.readfile(pe.foffset_va(hstrlog[32].VA + 9), 1)
  end
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_42), string.byte(l_0_43)))
elseif hstrlog[33].matched then
  local l_0_44 = pe.mmap_va_nofastfail(hstrlog[33].VA + 5, 1)
  local l_0_45 = pe.mmap_va_nofastfail(hstrlog[33].VA + 11, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_44), string.byte(l_0_45)))
elseif hstrlog[34].matched then
  local l_0_46 = pe.mmap_va_nofastfail(hstrlog[34].VA + 4, 1)
  local l_0_47 = pe.mmap_va_nofastfail(hstrlog[34].VA + 29, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_46), string.byte(l_0_47)))
elseif hstrlog[35].matched then
  local l_0_48 = pe.mmap_va_nofastfail(hstrlog[35].VA + 5, 1)
  local l_0_49 = pe.mmap_va_nofastfail(hstrlog[35].VA + 7, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_48), string.byte(l_0_49)))
elseif hstrlog[36].matched then
  local l_0_50 = pe.mmap_va_nofastfail(hstrlog[36].VA + 15, 1)
  local l_0_51 = pe.mmap_va_nofastfail(hstrlog[36].VA + 21, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_50), string.byte(l_0_51)))
elseif hstrlog[37].matched then
  local l_0_52 = pe.mmap_va_nofastfail(hstrlog[37].VA + 5, 1)
  local l_0_53 = pe.mmap_va_nofastfail(hstrlog[37].VA + 7, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_52), string.byte(l_0_53)))
elseif hstrlog[38].matched then
  local l_0_54 = pe.mmap_va_nofastfail(hstrlog[38].VA + 11, 1)
  local l_0_55 = pe.mmap_va_nofastfail(hstrlog[38].VA + 13, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_54), string.byte(l_0_55)))
elseif hstrlog[39].matched then
  local l_0_56 = mp.readfile(pe.foffset_va(hstrlog[39].VA + 6), 1)
  local l_0_57 = mp.readfile(pe.foffset_va(hstrlog[39].VA + 9), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_56), string.byte(l_0_57)))
elseif hstrlog[40].matched then
  local l_0_58 = pe.mmap_va_nofastfail(hstrlog[40].VA + 12, 1)
  local l_0_59 = pe.mmap_va_nofastfail(hstrlog[40].VA + 24, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_58), string.byte(l_0_59)))
elseif hstrlog[41].matched then
  local l_0_60 = mp.readfile(pe.foffset_va(hstrlog[41].VA + 5), 1)
  local l_0_61 = mp.readfile(pe.foffset_va(hstrlog[41].VA + 7), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_60), string.byte(l_0_61)))
elseif hstrlog[42].matched then
  local l_0_62 = mp.readfile(pe.foffset_va(hstrlog[42].VA + 13), 1)
  local l_0_63 = mp.readfile(pe.foffset_va(hstrlog[42].VA + 15), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_62), string.byte(l_0_63)))
elseif hstrlog[43].matched then
  local l_0_64 = mp.readfile(pe.foffset_va(hstrlog[43].VA + 4), 1)
  local l_0_65 = mp.readfile(pe.foffset_va(hstrlog[43].VA + 7), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_64), string.byte(l_0_65)))
elseif hstrlog[44].matched then
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 66, 106))
elseif hstrlog[45].matched then
  local l_0_66 = mp.readfile(pe.foffset_va(hstrlog[45].VA + 4), 1)
  local l_0_67 = mp.readfile(pe.foffset_va(hstrlog[45].VA + 6), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_66), string.byte(l_0_67)))
elseif hstrlog[46].matched then
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 109, 109))
elseif hstrlog[47].matched then
  local l_0_68 = mp.readfile(pe.foffset_va(hstrlog[47].VA + 28), 1)
  local l_0_69 = mp.readfile(pe.foffset_va(hstrlog[47].VA + 40), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_68), string.byte(l_0_69)))
elseif hstrlog[48].matched then
  local l_0_70 = mp.readfile(pe.foffset_va(hstrlog[48].VA + 9), 1)
  local l_0_71 = mp.readfile(pe.foffset_va(hstrlog[48].VA + 11), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_70), mp.bitand(-string.byte(l_0_71), 255)))
elseif hstrlog[49].matched then
  local l_0_72 = mp.readfile(pe.foffset_va(hstrlog[49].VA + 35), 1)
  local l_0_73 = mp.readfile(pe.foffset_va(hstrlog[49].VA + 43), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_72), string.byte(l_0_73)))
elseif hstrlog[50].matched then
  local l_0_74 = mp.readfile(pe.foffset_va(hstrlog[50].VA + 22), 1)
  local l_0_75 = mp.readfile(pe.foffset_va(hstrlog[50].VA + 34), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_74), string.byte(l_0_75)))
elseif hstrlog[51].matched then
  local l_0_76 = mp.readfile(pe.foffset_va(hstrlog[51].VA + 25), 1)
  local l_0_77 = mp.readfile(pe.foffset_va(hstrlog[51].VA + 27), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_76), mp.bitand(-string.byte(l_0_77), 255)))
elseif hstrlog[52].matched then
  local l_0_78 = mp.readfile(pe.foffset_va(hstrlog[52].VA + 35), 1)
  local l_0_79 = mp.readfile(pe.foffset_va(hstrlog[52].VA + 37), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_78), mp.bitand(-string.byte(l_0_79), 255)))
elseif hstrlog[53].matched then
  local l_0_80 = mp.readfile(pe.foffset_va(hstrlog[53].VA + 6), 1)
  local l_0_81 = mp.readfile(pe.foffset_va(hstrlog[53].VA + 4), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_80), mp.bitand(-string.byte(l_0_81), 255)))
elseif hstrlog[54].matched then
  local l_0_82 = mp.readfile(pe.foffset_va(hstrlog[54].VA + 6), 1)
  local l_0_83 = mp.readfile(pe.foffset_va(hstrlog[54].VA + 4), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_82), string.byte(l_0_83)))
elseif hstrlog[55].matched then
  local l_0_84 = mp.readfile(pe.foffset_va(hstrlog[55].VA + 13), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_84), string.byte(l_0_84)))
elseif hstrlog[56].matched then
  local l_0_85 = mp.readfile(pe.foffset_va(hstrlog[56].VA + 10), 1)
  local l_0_86 = mp.readfile(pe.foffset_va(hstrlog[56].VA + 12), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_85), string.byte(l_0_86)))
elseif hstrlog[57].matched then
  local l_0_87 = mp.readfile(pe.foffset_va(hstrlog[57].VA + 8), 1)
  local l_0_88 = mp.readfile(pe.foffset_va(hstrlog[57].VA + 5), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_87), string.byte(l_0_88)))
elseif hstrlog[58].matched then
  local l_0_89 = mp.readfile(pe.foffset_va(hstrlog[58].VA + 11), 1)
  local l_0_90 = mp.readfile(pe.foffset_va(hstrlog[58].VA + 14), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_89), string.byte(l_0_90)))
elseif hstrlog[59].matched then
  local l_0_91 = mp.readfile(pe.foffset_va(hstrlog[59].VA + 6), 1)
  local l_0_92 = mp.readfile(pe.foffset_va(hstrlog[59].VA + 4), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_91), mp.bitand(-string.byte(l_0_92), 255)))
elseif hstrlog[60].matched then
  local l_0_93 = mp.readfile(pe.foffset_va(hstrlog[60].VA + 10), 1)
  local l_0_94 = mp.readfile(pe.foffset_va(hstrlog[60].VA + 12), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_93), string.byte(l_0_94)))
elseif hstrlog[61].matched then
  local l_0_95 = mp.readfile(pe.foffset_va(hstrlog[61].VA + 10), 1)
  local l_0_96 = mp.readfile(pe.foffset_va(hstrlog[61].VA + 12), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_95), string.byte(l_0_96)))
elseif hstrlog[62].matched then
  local l_0_97 = mp.readfile(pe.foffset_va(hstrlog[62].VA + 4), 1)
  local l_0_98 = l_0_97
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_97), string.byte(l_0_98)))
elseif hstrlog[63].matched then
  local l_0_99 = mp.readfile(pe.foffset_va(hstrlog[63].VA + 6), 1)
  local l_0_100 = mp.readfile(pe.foffset_va(hstrlog[63].VA + 4), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_99), mp.bitand(-string.byte(l_0_100), 255)))
elseif hstrlog[64].matched then
  local l_0_101 = mp.readfile(pe.foffset_va(hstrlog[64].VA + 13), 1)
  local l_0_102 = mp.readfile(pe.foffset_va(hstrlog[64].VA + 15), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_101), mp.bitand(-string.byte(l_0_102), 255)))
elseif hstrlog[65].matched then
  local l_0_103 = mp.readfile(pe.foffset_va(hstrlog[65].VA + 33), 1)
  local l_0_104 = mp.readfile(pe.foffset_va(hstrlog[65].VA + 45), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_103), mp.bitand(-string.byte(l_0_104), 255)))
elseif hstrlog[66].matched then
  local l_0_105 = mp.readfile(pe.foffset_va(hstrlog[66].VA + 38), 1)
  local l_0_106 = mp.readfile(pe.foffset_va(hstrlog[66].VA + 26), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_105), mp.bitand(-string.byte(l_0_106), 255)))
elseif hstrlog[67].matched then
  local l_0_107 = mp.readfile(pe.foffset_va(hstrlog[67].VA + 10), 1)
  local l_0_108 = mp.readfile(pe.foffset_va(hstrlog[67].VA + 12), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_107), mp.bitand(-string.byte(l_0_108), 255)))
elseif hstrlog[68].matched then
  local l_0_109 = mp.readfile(pe.foffset_va(hstrlog[68].VA + 18), 1)
  local l_0_110 = mp.readfile(pe.foffset_va(hstrlog[68].VA + 16), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_109), mp.bitand(-string.byte(l_0_110), 255)))
elseif hstrlog[69].matched then
  local l_0_111 = mp.readfile(pe.foffset_va(hstrlog[69].VA + 11), 1)
  local l_0_112 = mp.readfile(pe.foffset_va(hstrlog[69].VA + 16), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_111), string.byte(l_0_112)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[70].matched then
  local l_0_113 = mp.readfile(pe.foffset_va(hstrlog[70].VA + 9), 1)
  local l_0_114 = mp.readfile(pe.foffset_va(hstrlog[70].VA + 7), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_113), mp.bitand(-string.byte(l_0_114), 255)))
elseif hstrlog[71].matched then
  local l_0_115 = mp.readfile(pe.foffset_va(hstrlog[71].VA + 11), 1)
  local l_0_116 = mp.readfile(pe.foffset_va(hstrlog[71].VA + 16), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_115), string.byte(l_0_116)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[72].matched then
  local l_0_117 = mp.readfile(pe.foffset_va(hstrlog[72].VA + 6), 1)
  local l_0_118 = mp.readfile(pe.foffset_va(hstrlog[72].VA + 11), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_117), string.byte(l_0_118)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[73].matched then
  local l_0_119 = mp.readfile(pe.foffset_va(hstrlog[73].VA + 9), 1)
  local l_0_120 = mp.readfile(pe.foffset_va(hstrlog[73].VA + 7), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_119), mp.bitand(-string.byte(l_0_120), 255)))
elseif hstrlog[74].matched then
  local l_0_121 = mp.readfile(pe.foffset_va(hstrlog[74].VA + 11), 1)
  local l_0_122 = mp.readfile(pe.foffset_va(hstrlog[74].VA + 14), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_121), mp.bitand(-string.byte(l_0_122), 255)))
elseif hstrlog[75].matched then
  local l_0_123 = mp.readfile(pe.foffset_va(hstrlog[75].VA + 8), 1)
  local l_0_124 = mp.readfile(pe.foffset_va(hstrlog[75].VA + 5), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_123), mp.bitand(-string.byte(l_0_124), 255)))
elseif hstrlog[76].matched then
  local l_0_125 = mp.readfile(pe.foffset_va(hstrlog[76].VA + 4), 1)
  local l_0_126 = mp.readfile(pe.foffset_va(hstrlog[76].VA + 6), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_125), string.byte(l_0_126)))
elseif hstrlog[77].matched then
  local l_0_127 = mp.readfile(pe.foffset_va(hstrlog[77].VA + 8), 1)
  local l_0_128 = mp.readfile(pe.foffset_va(hstrlog[77].VA + 11), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_127), mp.bitand(-string.byte(l_0_128), 255)))
elseif hstrlog[78].matched then
  local l_0_129 = mp.readfile(pe.foffset_va(hstrlog[78].VA + 18), 1)
  local l_0_130 = mp.readfile(pe.foffset_va(hstrlog[78].VA + 21), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_129), mp.bitand(-string.byte(l_0_130), 255)))
elseif hstrlog[79].matched then
  local l_0_131 = mp.readfile(pe.foffset_va(hstrlog[79].VA + 18), 1)
  local l_0_132 = mp.readfile(pe.foffset_va(hstrlog[79].VA + 31), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_131), mp.bitand(-string.byte(l_0_132), 255)))
elseif hstrlog[80].matched then
  local l_0_133 = mp.readfile(pe.foffset_va(hstrlog[80].VA + 18), 1)
  local l_0_134 = mp.readfile(pe.foffset_va(hstrlog[80].VA + 21), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_133), mp.bitand(-string.byte(l_0_134), 255)))
elseif hstrlog[81].matched then
  local l_0_135 = mp.readfile(pe.foffset_va(hstrlog[81].VA + 8), 1)
  local l_0_136 = mp.readfile(pe.foffset_va(hstrlog[81].VA + 11), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_135), mp.bitand(-string.byte(l_0_136), 255)))
elseif hstrlog[82].matched then
  local l_0_137 = mp.readfile(pe.foffset_va(hstrlog[82].VA + 8), 1)
  local l_0_138 = mp.readfile(pe.foffset_va(hstrlog[82].VA + 21), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_137), mp.bitand(-string.byte(l_0_138), 255)))
elseif hstrlog[83].matched then
  local l_0_139 = mp.readfile(pe.foffset_va(hstrlog[83].VA + 18), 1)
  local l_0_140 = mp.readfile(pe.foffset_va(hstrlog[83].VA + 31), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_139), mp.bitand(-string.byte(l_0_140), 255)))
elseif hstrlog[84].matched then
  local l_0_141 = mp.readfile(pe.foffset_va(hstrlog[84].VA + 8), 1)
  local l_0_142 = mp.readfile(pe.foffset_va(hstrlog[84].VA + 21), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_141), mp.bitand(-string.byte(l_0_142), 255)))
elseif hstrlog[85].matched then
  local l_0_143 = mp.readfile(pe.foffset_va(hstrlog[85].VA + 5), 1)
  local l_0_144 = mp.readfile(pe.foffset_va(hstrlog[85].VA + 8), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_143), mp.bitand(-string.byte(l_0_144), 255)))
elseif hstrlog[86].matched then
  local l_0_145 = mp.readfile(pe.foffset_va(hstrlog[86].VA + 5), 1)
  local l_0_146 = mp.readfile(pe.foffset_va(hstrlog[86].VA + 8), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_145), string.byte(l_0_146)))
elseif hstrlog[87].matched then
  local l_0_147 = mp.readfile(pe.foffset_va(hstrlog[87].VA + 8), 1)
  local l_0_148 = mp.readfile(pe.foffset_va(hstrlog[87].VA + 11), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_147), string.byte(l_0_148)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[88].matched then
  local l_0_149 = mp.readfile(pe.foffset_va(hstrlog[88].VA + 6), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, string.byte(l_0_149)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[89].matched then
  local l_0_150 = mp.readfile(pe.foffset_va(hstrlog[89].VA + 6), 1)
  local l_0_151 = mp.readfile(pe.foffset_va(hstrlog[89].VA + 9), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_150), string.byte(l_0_151)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[90].matched then
  local l_0_152 = mp.readfile(pe.foffset_va(hstrlog[90].VA + 6), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, string.byte(l_0_152)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[91].matched then
  local l_0_153 = mp.readfile(pe.foffset_va(hstrlog[91].VA + 8), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, string.byte(l_0_153)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[92].matched then
  local l_0_154 = mp.readfile(pe.foffset_va(hstrlog[92].VA + 8), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, string.byte(l_0_154)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[93].matched then
  local l_0_155 = mp.readfile(pe.foffset_va(hstrlog[93].VA + 8), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, mp.bitand(-string.byte(l_0_155), 255)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[94].matched then
  local l_0_156 = mp.readfile(pe.foffset_va(hstrlog[94].VA + 6), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, string.byte(l_0_156)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[95].matched then
  local l_0_157 = mp.readfile(pe.foffset_va(hstrlog[95].VA + 7), 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", 0, string.byte(l_0_157)))
  mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.PN!hdsz.1C")
elseif hstrlog[17].matched then
  local l_0_158 = pe.mmap_va_nofastfail(hstrlog[17].VA + 4, 1)
  local l_0_159 = pe.mmap_va_nofastfail(hstrlog[17].VA + 16, 1)
  mp.set_mpattribute(string.format("HSTR:VirTool:Win32/Obfuscator.PN!k4_k5.0_%02X%02X", string.byte(l_0_158), string.byte(l_0_159)))
end
return mp.CLEAN
