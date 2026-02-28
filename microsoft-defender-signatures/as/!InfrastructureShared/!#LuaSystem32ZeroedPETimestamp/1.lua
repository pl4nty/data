local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pehdr
L0_1 = L0_1.TimeDateStamp
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if L0_1 < 3000000 then
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L2_1 = mp
    L2_1 = L2_1.FILEPATH_QUERY_FULL
    L1_1 = L1_1(L2_1)
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = L1_1
    L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    L1_1 = L2_1
    if L1_1 ~= nil then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "c:\\windows\\system32\\"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 then
        L3_1 = L1_1
        L2_1 = L1_1.find
        L4_1 = "\\driverstore\\filerepository\\"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 then
          L2_1 = mp
          L2_1 = L2_1.CLEAN
          return L2_1
        end
        L3_1 = L1_1
        L2_1 = L1_1.find
        L4_1 = "\\spool\\drivers\\x64\\3\\"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 then
          L2_1 = mp
          L2_1 = L2_1.CLEAN
          return L2_1
        end
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
