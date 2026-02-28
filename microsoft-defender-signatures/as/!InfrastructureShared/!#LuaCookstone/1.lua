local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCPT:Cookstone"
L0_1 = L0_1(L1_1)
L1_1 = #L0_1
if 0 < L1_1 then
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
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "mtprotostate"
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
  L4_1 = "\\downloads\\"
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
  L4_1 = "\\telegram desktop"
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
  L4_1 = "greenlet"
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
  L4_1 = "bot"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = mp
  L2_1 = L2_1.enum_mpattributesubstring
  L3_1 = "SCPT:CookstoneA"
  L2_1 = L2_1(L3_1)
  L3_1 = #L2_1
  if 0 < L3_1 then
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "telegram"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "mitm_manager"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "\\telegram_testing\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L1_1
          L3_1 = L1_1.find
          L5_1 = "\\mitm_tools"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L1_1
            L3_1 = L1_1.find
            L5_1 = "\\wifibox"
            L6_1 = 1
            L7_1 = true
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L4_1 = L1_1
              L3_1 = L1_1.find
              L5_1 = "\\fake_ap"
              L6_1 = 1
              L7_1 = true
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                goto lbl_121
              end
            end
          end
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:CookstoneA"
    L3_1(L4_1)
  end
  ::lbl_121::
  L3_1 = mp
  L3_1 = L3_1.enum_mpattributesubstring
  L4_1 = "SCPT:CookstoneB"
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = #L2_1
  if 0 < L3_1 then
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "\\packages\\telegram\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "mitm_manager"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L1_1
        L3_1 = L1_1.find
        L5_1 = "\\core\\telegram_testing\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          goto lbl_154
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:CookstoneB"
    L3_1(L4_1)
  end
  ::lbl_154::
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
