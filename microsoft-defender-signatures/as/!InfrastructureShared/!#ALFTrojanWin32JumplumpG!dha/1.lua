local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "applicationframe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "wmiprvsd"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = "wuapi"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L2_1 = L0_1
        L1_1 = L0_1.find
        L3_1 = "propsys"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L2_1 = L0_1
          L1_1 = L0_1.find
          L3_1 = "wbemprox"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L2_1 = L0_1
            L1_1 = L0_1.find
            L3_1 = "actioncenter"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              goto lbl_83
            end
          end
        end
      end
    end
  end
  L1_1 = {}
  L1_1.ShareProviderInitialize = ""
  L1_1.ShareProviderUninitialize = ""
  L1_1.ShareProviderShareAdd = ""
  L1_1.ShareProviderShareSetInfo = ""
  L1_1.ShareProviderShareDel = ""
  L2_1 = pe
  L2_1 = L2_1.get_exports
  L2_1, L3_1 = L2_1()
  if 3 < L2_1 then
    L4_1 = 1
    L5_1 = L2_1
    L6_1 = 1
    for L7_1 = L4_1, L5_1, L6_1 do
      L8_1 = pe
      L8_1 = L8_1.mmap_string_rva
      L9_1 = L3_1[L7_1]
      L9_1 = L9_1.namerva
      L10_1 = 64
      L8_1 = L8_1(L9_1, L10_1)
      L9_1 = L1_1[L8_1]
      if L9_1 then
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    end
  end
end
::lbl_83::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
