local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil and L0_1 ~= "" then
    L1_1 = mp
    L1_1 = L1_1.GetExecutablesFromCommandLine
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if L1_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = "mac_scp_file_transfer"
    L3_1 = GetRollingQueueCount
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if 0 < L3_1 then
      L3_1 = IsKeyInRollingQueue
      L4_1 = L2_1
      L5_1 = "file_transferred_path"
      L6_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 then
        L3_1 = GetRollingQueueKeyValues
        L4_1 = L2_1
        L5_1 = "file_transferred_path"
        L3_1 = L3_1(L4_1, L5_1)
        if L3_1 ~= nil then
          L4_1 = #L3_1
          if 0 < L4_1 then
            L4_1 = ipairs
            L5_1 = L3_1
            L4_1, L5_1, L6_1 = L4_1(L5_1)
            for L7_1, L8_1 in L4_1, L5_1, L6_1 do
              L9_1 = ipairs
              L10_1 = L1_1
              L9_1, L10_1, L11_1 = L9_1(L10_1)
              for L12_1, L13_1 in L9_1, L10_1, L11_1 do
                L14_1 = string
                L14_1 = L14_1.find
                L15_1 = L13_1
                L16_1 = "/"
                L17_1 = 1
                L18_1 = true
                L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
                if L14_1 == 1 then
                  L14_1 = string
                  L14_1 = L14_1.find
                  L15_1 = tostring
                  L16_1 = L8_1.value
                  L15_1 = L15_1(L16_1)
                  L16_1 = L13_1
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
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
