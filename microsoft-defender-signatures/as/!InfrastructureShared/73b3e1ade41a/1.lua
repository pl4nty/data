local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[3]
      L0_1 = L0_1.utf8p1
      L1_1 = SuspMacPathsToMonitor
      L2_1 = L0_1
      L3_1 = true
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
      L1_1 = "mac_scp_file_transfer"
      L2_1 = bm
      L2_1 = L2_1.get_current_process_startup_info
      L2_1 = L2_1()
      L3_1 = L2_1.command_line
      L4_1 = GetRollingQueueCount
      L5_1 = L1_1
      L4_1 = L4_1(L5_1)
      if 0 < L4_1 and L3_1 ~= nil and L3_1 ~= "" then
        L4_1 = IsKeyInRollingQueue
        L5_1 = L1_1
        L6_1 = "zip_transferred_path"
        L7_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1)
        if not L4_1 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
        L4_1 = GetRollingQueueKeyValues
        L5_1 = L1_1
        L6_1 = "zip_transferred_path"
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 ~= nil then
          L5_1 = #L4_1
          if not (L5_1 <= 0) then
            goto lbl_64
          end
        end
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        do return L5_1 end
        ::lbl_64::
        L5_1 = ipairs
        L6_1 = L4_1
        L5_1, L6_1, L7_1 = L5_1(L6_1)
        for L8_1, L9_1 in L5_1, L6_1, L7_1 do
          L10_1 = L9_1.value
          L11_1 = L10_1
          L10_1 = L10_1.match
          L12_1 = "[^/]*$"
          L10_1 = L10_1(L11_1, L12_1)
          L11_1 = string
          L11_1 = L11_1.find
          L12_1 = L3_1
          L13_1 = L10_1
          L14_1 = 1
          L15_1 = true
          L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
          if L11_1 then
            L11_1 = mp
            L11_1 = L11_1.INFECTED
            return L11_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
