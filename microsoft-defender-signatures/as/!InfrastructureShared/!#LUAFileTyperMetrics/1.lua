local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = "FileTyperMetrics"
L1_1 = "FileExtMetrics"
L2_1 = "FileTyperTimer"
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = "BM_"
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L4_1 = #L3_1
  if 0 < L4_1 then
    L4_1 = AddToAtomicCounter
    L5_1 = L2_1
    L6_1 = 1
    L7_1 = 27000
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if L4_1 == nil or L4_1 == 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "LUA:FileTyperReportMetrics"
      L5_1(L6_1)
    end
    L5_1 = ipairs
    L6_1 = L3_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = StringEndsWith
      L11_1 = L9_1
      L12_1 = "_FILE"
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = GetRollingQueueKeyValue
        L11_1 = L0_1
        L12_1 = L9_1
        L10_1 = L10_1(L11_1, L12_1)
        if L10_1 ~= nil then
          L11_1 = AppendToRollingQueue
          L12_1 = L0_1
          L13_1 = L9_1
          L14_1 = L10_1 + 1
          L15_1 = 32400
          L11_1(L12_1, L13_1, L14_1, L15_1)
        else
          L11_1 = AppendToRollingQueue
          L12_1 = L0_1
          L13_1 = L9_1
          L14_1 = 1
          L15_1 = 32400
          L11_1(L12_1, L13_1, L14_1, L15_1)
        end
        if L9_1 == "BM_UNKNOWN_FILE" then
          L11_1 = mp
          L11_1 = L11_1.getfilename
          L12_1 = mp
          L12_1 = L12_1.FILEPATH_QUERY_FNAME
          L11_1 = L11_1(L12_1)
          L12_1 = string
          L12_1 = L12_1.match
          L13_1 = L11_1
          L14_1 = "%.([^.]+)$"
          L12_1 = L12_1(L13_1, L14_1)
          if L12_1 == nil then
            L13_1 = "<none>"
            L12_1 = L13_1 or L12_1
            if not L13_1 then
            end
          end
          L13_1 = GetRollingQueueKeyValue
          L14_1 = L1_1
          L15_1 = L12_1
          L13_1 = L13_1(L14_1, L15_1)
          if L13_1 ~= nil then
            L14_1 = AppendToRollingQueue
            L15_1 = L1_1
            L16_1 = L12_1
            L17_1 = L13_1 + 1
            L18_1 = 32400
            L14_1(L15_1, L16_1, L17_1, L18_1)
          else
            L14_1 = AppendToRollingQueue
            L15_1 = L1_1
            L16_1 = L12_1
            L17_1 = 1
            L18_1 = 32400
            L14_1(L15_1, L16_1, L17_1, L18_1)
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
