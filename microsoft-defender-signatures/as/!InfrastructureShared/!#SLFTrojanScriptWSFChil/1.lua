local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.IOAVGetDownloadUrl
L0_1 = L0_1()
if L0_1 then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "http:"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
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
    if L1_1 then
      L2_1 = MpCommon
      L2_1 = L2_1.PathToWin32Path
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if L2_1 == nil then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L4_1 = L2_1
      L3_1 = L2_1.match
      L5_1 = "%->.+/"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.match
        L5_1 = "%->.+\\"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.match
          L5_1 = "%->.+%->"
          L3_1 = L3_1(L4_1, L5_1)
          if not L3_1 then
            goto lbl_52
          end
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_52::
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = ".zip->"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = ".rar->"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = ".7z->"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L2_1
            L3_1 = L2_1.find
            L5_1 = ".tar.gz->"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              goto lbl_83
            end
          end
        end
      end
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
::lbl_83::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
