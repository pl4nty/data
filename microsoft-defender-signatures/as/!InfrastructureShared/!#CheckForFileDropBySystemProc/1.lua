local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.ENGINEBUILD
if 19850 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:RemoteContextPresent"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "Lua:RemoteCopyExclusions"
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = MpCommon
  L3_2 = L3_2.QueryPersistContext
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = MpCommon
    L4_2 = L4_2.AppendPersistContext
    L5_2 = A0_2
    L6_2 = A1_2
    L7_2 = 100
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = mp
  L4_2 = L4_2.set_mpattribute
  L5_2 = A2_2
  L4_2(L5_2)
end

SetAttributeAndContext = L0_1
L0_1 = mp
L0_1 = L0_1.CLEAN
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.sub
L4_1 = 1
L5_1 = 8
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == "\\device\\" then
  L2_1 = MpCommon
  L2_1 = L2_1.PathToWin32Path
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.sub
L5_1 = 1
L6_1 = 8
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == "\\device\\" then
  L3_1 = MpCommon
  L3_1 = L3_1.PathToWin32Path
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = {}
L3_1["c:\\windows\\system32"] = "sysdir"
L3_1["c:\\windows"] = "windir"
L3_1["c:\\windows\\temp"] = "wintemp"
L3_1["c:\\users\\public\\desktop"] = "usrprofpub"
L3_1["c:\\users\\public\\documents"] = "usrprofpub"
L3_1["c:\\users\\default\\documents"] = "usrprofdef"
L3_1["c:\\users\\default\\desktop"] = "usrprofdef"
L3_1["c:\\perflogs"] = "perflog"
L3_1["c:"] = "c_root"
L3_1["d:"] = "d_root"
L3_1["e:"] = "e_root"
L3_1["f:"] = "f_root"
L3_1["g:"] = "g_root"
L3_1["h:"] = "h_root"
L3_1["i:"] = "i_root"
L3_1["j:"] = "j_root"
L3_1["k:"] = "k_root"
L3_1["l:"] = "l_root"
L3_1["m:"] = "m_root"
L3_1["n:"] = "n_root"
L3_1["o:"] = "o_root"
L3_1["p:"] = "p_root"
L3_1["q:"] = "q_root"
L3_1["r:"] = "r_root"
L3_1["s:"] = "s_root"
L3_1["t:"] = "t_root"
L3_1["u:"] = "u_root"
L3_1["v:"] = "v_root"
L3_1["w:"] = "w_root"
L3_1["x:"] = "x_root"
L3_1["y:"] = "y_root"
L3_1["z:"] = "z_root"
L4_1 = L3_1[L1_1]
L5_1 = "FileDropBySystemProc_"
L6_1 = "Lua:Context/FileDropBySystemProc!"
L7_1 = mp
L7_1 = L7_1.get_mpattribute
L8_1 = "BM_MZ_FILE"
L7_1 = L7_1(L8_1)
if L7_1 then
  L5_1 = "ExeFileDropBySystemProc_"
  L6_1 = "Lua:Context/ExeFileDropBySystemProc!"
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:SuspExeFileDropBySystemProc"
  L7_1(L8_1)
  L7_1 = AppendToRollingQueue
  L8_1 = "SuspExeFileDroppedViaSMB"
  L9_1 = L2_1
  L10_1 = nil
  L11_1 = 5000
  L7_1(L8_1, L9_1, L10_1, L11_1)
else
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:SuspFileDropBySystemProc"
  L7_1(L8_1)
  L7_1 = AppendToRollingQueue
  L8_1 = "SuspFileDroppedViaSMB"
  L9_1 = L2_1
  L10_1 = nil
  L11_1 = 5000
  L7_1(L8_1, L9_1, L10_1, L11_1)
end
L7_1 = L3_1[L1_1]
if L7_1 ~= nil then
  L7_1 = L5_1
  L8_1 = L4_1
  L7_1 = L7_1 .. L8_1
  L8_1 = L6_1
  L9_1 = L4_1
  L8_1 = L8_1 .. L9_1
  L9_1 = SetAttributeAndContext
  L10_1 = L2_1
  L11_1 = L7_1
  L12_1 = L8_1
  L9_1(L10_1, L11_1, L12_1)
  L10_1 = L4_1
  L9_1 = L4_1.find
  L11_1 = "_root"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 then
    L9_1 = mp
    L9_1 = L9_1.set_mpattribute
    L10_1 = "Lua:Context/FileDropBySystemAtRoot"
    L9_1(L10_1)
  end
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L7_1 = mp
L7_1 = L7_1.get_mpattribute
L8_1 = "Lua:CloudBlockLevelGT3"
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = mp
  L7_1 = L7_1.get_mpattribute
  L8_1 = "Lua:TT:DetectionThresholdMet"
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    goto lbl_334
  end
end
L7_1 = false
L9_1 = L1_1
L8_1 = L1_1.match
L10_1 = "c:\\users\\.-\\appdata\\.-\\microsoft\\windows\\start menu\\programs\\startup"
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L4_1 = "startup"
  L8_1 = L5_1
  L9_1 = L4_1
  L8_1 = L8_1 .. L9_1
  L9_1 = L6_1
  L10_1 = L4_1
  L9_1 = L9_1 .. L10_1
  L10_1 = SetAttributeAndContext
  L11_1 = L2_1
  L12_1 = L8_1
  L13_1 = L9_1
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = mp
  L0_1 = L10_1.INFECTED
  L7_1 = true
end
L9_1 = L1_1
L8_1 = L1_1.match
L10_1 = "c:\\users\\.-\\desktop\\[^\\]*$"
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L4_1 = "desktop"
  L8_1 = L5_1
  L9_1 = L4_1
  L8_1 = L8_1 .. L9_1
  L9_1 = L6_1
  L10_1 = L4_1
  L9_1 = L9_1 .. L10_1
  L10_1 = SetAttributeAndContext
  L11_1 = L2_1
  L12_1 = L8_1
  L13_1 = L9_1
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = mp
  L0_1 = L10_1.INFECTED
end
L9_1 = L1_1
L8_1 = L1_1.match
L10_1 = "c:\\users\\.-\\appdata\\local\\temp"
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L4_1 = "usrtemp"
  L8_1 = L5_1
  L9_1 = L4_1
  L8_1 = L8_1 .. L9_1
  L9_1 = L6_1
  L10_1 = L4_1
  L9_1 = L9_1 .. L10_1
  L10_1 = SetAttributeAndContext
  L11_1 = L2_1
  L12_1 = L8_1
  L13_1 = L9_1
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = mp
  L0_1 = L10_1.INFECTED
  L7_1 = true
end
if not L7_1 then
  L9_1 = L1_1
  L8_1 = L1_1.match
  L10_1 = "c:\\users\\.-\\appdata\\local\\"
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 then
    L4_1 = "appdatalocal"
    L8_1 = L5_1
    L9_1 = L4_1
    L8_1 = L8_1 .. L9_1
    L9_1 = L6_1
    L10_1 = L4_1
    L9_1 = L9_1 .. L10_1
    L10_1 = SetAttributeAndContext
    L11_1 = L2_1
    L12_1 = L8_1
    L13_1 = L9_1
    L10_1(L11_1, L12_1, L13_1)
    L10_1 = mp
    L0_1 = L10_1.INFECTED
  end
end
L9_1 = L1_1
L8_1 = L1_1.match
L10_1 = "c:\\windows\\system32\\config\\systemprofile"
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L9_1 = L1_1
  L8_1 = L1_1.find
  L10_1 = "\\appdata\\"
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if not L8_1 then
    L4_1 = "sysprof"
    L8_1 = L5_1
    L9_1 = L4_1
    L8_1 = L8_1 .. L9_1
    L9_1 = L6_1
    L10_1 = L4_1
    L9_1 = L9_1 .. L10_1
    L10_1 = SetAttributeAndContext
    L11_1 = L2_1
    L12_1 = L8_1
    L13_1 = L9_1
    L10_1(L11_1, L12_1, L13_1)
    L10_1 = mp
    L0_1 = L10_1.INFECTED
  end
end
L9_1 = L1_1
L8_1 = L1_1.match
L10_1 = "c:\\windows\\system32\\config\\systemprofile\\appdata"
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L4_1 = "sysappdata"
  L8_1 = L5_1
  L9_1 = L4_1
  L8_1 = L8_1 .. L9_1
  L9_1 = L6_1
  L10_1 = L4_1
  L9_1 = L9_1 .. L10_1
  L10_1 = SetAttributeAndContext
  L11_1 = L2_1
  L12_1 = L8_1
  L13_1 = L9_1
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = mp
  L0_1 = L10_1.INFECTED
end
L9_1 = L1_1
L8_1 = L1_1.match
L10_1 = "c:\\windows\\system32\\spool\\"
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L4_1 = "spool"
  L8_1 = L5_1
  L9_1 = L4_1
  L8_1 = L8_1 .. L9_1
  L9_1 = L6_1
  L10_1 = L4_1
  L9_1 = L9_1 .. L10_1
  L10_1 = SetAttributeAndContext
  L11_1 = L2_1
  L12_1 = L8_1
  L13_1 = L9_1
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = mp
  L0_1 = L10_1.INFECTED
end
::lbl_334::
L7_1 = mp
L7_1 = L7_1.INFECTED
if L0_1 == L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
