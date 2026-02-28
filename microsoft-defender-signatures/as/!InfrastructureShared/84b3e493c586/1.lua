local L0_1, L1_1, L2_1, L3_1, L4_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = MpCommon
  L2_2 = L2_2.PathToWin32Path
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2)
  A0_2 = L1_2
  L1_2 = sysio
  L1_2 = L1_2.IsFileExists
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = sysio
  L1_2 = L1_2.GetFileLastWriteTime
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = sysio
  L2_2 = L2_2.GetLastResult
  L2_2 = L2_2()
  L2_2 = L2_2.Success
  if not L2_2 or L1_2 == 0 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L1_2 / 10000000
  L1_2 = L2_2 - 11644473600
  L2_2 = MpCommon
  L2_2 = L2_2.GetCurrentTimeT
  L2_2 = L2_2()
  if L1_2 >= L2_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = L2_2 - L1_2
  L3_2 = L3_2 / 60
  return L3_2
end

file_time = L0_1
L0_1 = file_time
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= nil and L0_1 <= 60 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    if L2_1 then
      L2_1 = reportGenericRansomware
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L3_1 = L3_1.utf8p2
      L4_1 = true
      L2_1 = L2_1(L3_1, L4_1)
      L1_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p2
      if L2_1 then
        L2_1 = reportGenericRansomware
        L3_1 = this_sigattrlog
        L3_1 = L3_1[2]
        L3_1 = L3_1.utf8p2
        L4_1 = true
        L2_1 = L2_1(L3_1, L4_1)
        L1_1 = L2_1
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  if L1_1 == L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
