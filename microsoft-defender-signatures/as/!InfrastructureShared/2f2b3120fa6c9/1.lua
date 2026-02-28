local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.GetProcessCommandLine
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    if L1_1 then
      L2_1 = MpCommon
      L2_1 = L2_1.StringRegExpSearch
      L3_1 = "(?i)(shortcutinstartmenu|runprocess|pipe|deletekey.reg|\\logs\\)"
      L4_1 = L1_1
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
    end
end
else
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L1_1 then
  L3_1 = ipairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.ppid
    if L8_1 then
      L8_1 = L7_1.image_path
      if L8_1 then
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = L7_1.image_path
        L8_1 = L8_1(L9_1)
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "sysaid"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.bitand
          L10_1 = L7_1.reason_ex
          L11_1 = 1
          L9_1 = L9_1(L10_1, L11_1)
          if L9_1 == 1 then
            L9_1 = mp
            L9_1 = L9_1.INFECTED
            return L9_1
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
