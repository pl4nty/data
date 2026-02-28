local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = "rq_ServiceImagePaths"
    L1_1 = bm
    L1_1 = L1_1.get_imagepath
    L1_1 = L1_1()
    if L1_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L3_1 = L1_1
    L2_1 = L1_1.gsub
    L4_1 = "[.exe$|.sys$]"
    L5_1 = ""
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
    L2_1 = GetRollingQueueKeys
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    if L2_1 ~= nil then
      L3_1 = type
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if L3_1 == "table" then
        goto lbl_40
      end
    end
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    do return L3_1 end
    ::lbl_40::
    L3_1 = ipairs
    L4_1 = L2_1
    L3_1, L4_1, L5_1 = L3_1(L4_1)
    for L6_1, L7_1 in L3_1, L4_1, L5_1 do
      L9_1 = L7_1
      L8_1 = L7_1.find
      L10_1 = L1_1
      L11_1 = 1
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if L8_1 then
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
