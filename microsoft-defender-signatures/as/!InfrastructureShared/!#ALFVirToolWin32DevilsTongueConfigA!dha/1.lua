local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 40000 or 48000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1 % 16
if L1_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L3_1 = L1_1
  L2_1 = L1_1.len
  L2_1 = L2_1(L3_1)
  if 40 < L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "c:\\windows\\system32\\config\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "\\config\\systemprofile\\"
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
      L4_1 = "\\system32\\config\\cache\\"
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
      L4_1 = "\\recoverybin\\"
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
      L4_1 = "\\appdata\\"
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
      L4_1 = "ntuser.dat"
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
      L4_1 = "\\system32\\config\\journal"
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
      L4_1 = "\\system32\\config\\regback"
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
      L4_1 = "\\system32\\config\\txr"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = select
      L3_1 = 2
      L4_1 = string
      L4_1 = L4_1.gsub
      L5_1 = L1_1
      L6_1 = "\\"
      L7_1 = ""
      L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1, L6_1, L7_1)
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
      if L2_1 < 5 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "MpNonPIIFileType"
      L3_1(L4_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
