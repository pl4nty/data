local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L1_1 = L0_1.utf8p1
    if not L1_1 or L1_1 == "" then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "[%a]:\\[^\"%>%s]*%.dll"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    
    function L3_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2
      L2_2 = A0_2
      L1_2 = A0_2.gsub
      L3_2 = "\\"
      L4_2 = "\\\\"
      L1_2 = L1_2(L2_2, L3_2, L4_2)
      L3_2 = L1_2
      L2_2 = L1_2.gsub
      L4_2 = "([%^%$%(%)%.%[%]%*%+%-%?])"
      L5_2 = "\\%1"
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      L1_2 = L2_2
      return L1_2
    end
    
    L4_1 = L3_1
    L5_1 = L2_1
    L4_1 = L4_1(L5_1)
    L5_1 = pcall
    L6_1 = MpCommon
    L6_1 = L6_1.RollingQueueQueryKeyRegex
    L7_1 = "RQ_RecentExecDropped_MultipleKey_30m"
    L8_1 = L4_1
    L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
    if not L5_1 or not L6_1 then
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
    L7_1 = L6_1.value
    if L7_1 ~= nil then
      L7_1 = {}
      L8_1 = L6_1
      L7_1[1] = L8_1
      if L7_1 then
        goto lbl_54
      end
    end
    L7_1 = L6_1
    ::lbl_54::
    L8_1 = ipairs
    L9_1 = L7_1
    L8_1, L9_1, L10_1 = L8_1(L9_1)
    for L11_1, L12_1 in L8_1, L9_1, L10_1 do
      if L12_1 then
        L13_1 = L12_1.value
        if L13_1 then
          goto lbl_64
        end
      end
      L13_1 = nil
      ::lbl_64::
      if L13_1 then
        L14_1 = type
        L15_1 = L13_1
        L14_1 = L14_1(L15_1)
        if L14_1 == "string" then
          L15_1 = L13_1
          L14_1 = L13_1.find
          L16_1 = "UnsignedFile"
          L17_1 = 1
          L18_1 = true
          L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
          if L14_1 then
            L14_1 = mp
            L14_1 = L14_1.INFECTED
            return L14_1
          end
        end
      end
    end
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
