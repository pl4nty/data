local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 67324752 then
  L0_1 = mp
  L0_1 = L0_1.readu_u32
  L1_1 = footerpage
  L2_1 = mp
  L2_1 = L2_1.FOOTERPAGE_SZ
  L2_1 = L2_1 - 21
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == 101010256 then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_SCANREASON
    L0_1 = L0_1(L1_1)
    L1_1 = mp
    L1_1 = L1_1.SCANREASON_ONOPEN
    if L0_1 ~= L1_1 then
      L1_1 = mp
      L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
      if L0_1 ~= L1_1 then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
    end
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.bitor
    L3_1 = mp
    L3_1 = L3_1.FILEPATH_QUERY_FULL
    L4_1 = mp
    L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1, L4_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
    L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L1_1
    L5_1 = "\\microsoft office\\office..\\....\\quickstyles"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "wordlr%.cab"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L1_1
        L5_1 = "devexpress%.snap%.v.....core%.dll"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          L3_1 = string
          L3_1 = L3_1.find
          L4_1 = L1_1
          L5_1 = "\\kingsoft\\wps cloud files\\userdata\\qing\\filecache"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.find
            L4_1 = L1_1
            L5_1 = "\\kingsoft\\wps office\\.+\\office6\\mui\\default\\templates\\normal.dotm"
            L3_1 = L3_1(L4_1, L5_1)
            if not L3_1 then
              goto lbl_91
            end
          end
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    do return L3_1 end
    ::lbl_91::
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = "winword.exe|wps.exe|dropbox.exe"
    L5_1 = L2_1
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "%.tmp$"
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
    end
    L3_1 = tostring
    L4_1 = footerpage
    L3_1 = L3_1(L4_1)
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "word/_rels/document.xml.rels"
    L4_1 = L4_1(L5_1, L6_1)
    if 22 <= L4_1 then
      L5_1 = mp
      L5_1 = L5_1.readu_u32
      L6_1 = L3_1
      L7_1 = L4_1 - 22
      L5_1 = L5_1(L6_1, L7_1)
      if 204800 < L5_1 then
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "MpForceScanArchives"
        L6_1(L7_1)
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
