local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = L1_1.command_line
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "services.exe"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = sysio
L3_1 = L3_1.IsFileExists
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.IsKnownFriendlyFile
  L4_1 = L0_1
  L5_1 = false
  L6_1 = false
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == false then
    L3_1 = MpCommon
    L3_1 = L3_1.GetPersistContextNoPath
    L4_1 = "ServiceBinHijack"
    L3_1 = L3_1(L4_1)
    if L3_1 ~= nil then
      L4_1 = ipairs
      L5_1 = L3_1
      L4_1, L5_1, L6_1 = L4_1(L5_1)
      for L7_1, L8_1 in L4_1, L5_1, L6_1 do
        L9_1 = string
        L9_1 = L9_1.lower
        L10_1 = L8_1
        L9_1 = L9_1(L10_1)
        L10_1 = string
        L10_1 = L10_1.lower
        L11_1 = L0_1
        L10_1 = L10_1(L11_1)
        if L9_1 == L10_1 then
          L9_1 = bm
          L9_1 = L9_1.add_related_file
          L10_1 = L0_1
          L9_1(L10_1)
          L9_1 = mp
          L9_1 = L9_1.INFECTED
          return L9_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
