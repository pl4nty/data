local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = L0_1.command_line
    L2_1 = L1_1
    L1_1 = L1_1.find
    L3_1 = " -c "
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 then
      L1_1 = bm
      L1_1 = L1_1.get_process_relationships
      L1_1, L2_1 = L1_1()
      L3_1 = ipairs
      L4_1 = L1_1
      L3_1, L4_1, L5_1 = L3_1(L4_1)
      for L6_1, L7_1 in L3_1, L4_1, L5_1 do
        L8_1 = L7_1.image_path
        if L8_1 ~= nil then
          L9_1 = {}
          L9_1["raystation.exe"] = true
          L9_1["devenv.exe"] = true
          L9_1["code.exe"] = true
          L10_1 = string
          L10_1 = L10_1.lower
          L12_1 = L8_1
          L11_1 = L8_1.match
          L13_1 = "\\([^\\]+)$"
          L11_1, L12_1, L13_1 = L11_1(L12_1, L13_1)
          L10_1 = L10_1(L11_1, L12_1, L13_1)
          L11_1 = L9_1[L10_1]
          if L11_1 then
            L11_1 = mp
            L11_1 = L11_1.CLEAN
            return L11_1
          end
        end
      end
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
