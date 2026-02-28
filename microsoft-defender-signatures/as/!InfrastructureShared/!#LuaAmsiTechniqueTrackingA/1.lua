local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = false
L1_1 = pcall
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "BM_MT"
L4_1 = mp
L4_1 = L4_1.enum_mpattributesubstring
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = type
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 == "table" then
    L5_1 = #L4_1
    if 0 < L5_1 then
      L5_1 = ipairs
      L6_1 = L4_1
      L5_1, L6_1, L7_1 = L5_1(L6_1)
      for L8_1, L9_1 in L5_1, L6_1, L7_1 do
        L10_1 = string
        L10_1 = L10_1.sub
        L11_1 = L9_1
        L12_1 = #L3_1
        L13_1 = #L9_1
        L10_1 = L10_1(L11_1, L12_1, L13_1)
        if L10_1 ~= nil then
          L11_1 = #L10_1
          if 5 <= L11_1 then
            L11_1 = string
            L11_1 = L11_1.match
            L12_1 = L10_1
            L13_1 = "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)"
            L11_1, L12_1 = L11_1(L12_1, L13_1)
            L13_1 = TrackPidAndTechnique
            L14_1 = L2_1
            L15_1 = L11_1
            L16_1 = L12_1
            L13_1(L14_1, L15_1, L16_1)
            L0_1 = true
          end
        end
      end
    end
  end
end
if L0_1 then
  L5_1 = mp
  L5_1 = L5_1.get_mpattribute
  L6_1 = "Lua:CloudBlockLevelGT5"
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = #L4_1
    if 3 < L5_1 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:AmsiTechniqueTracking"
      L5_1(L6_1)
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
