local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_AMSI_APPNAME
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if L1_1 and L2_1 then
    L3_1 = pcall
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
    L3_1, L4_1 = L3_1(L4_1, L5_1)
    if L3_1 and L4_1 ~= nil then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "\\powershell.exe"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.get_contextdata
        L6_1 = mp
        L6_1 = L6_1.CONTEXT_DATA_AMSI_OPERATION_PPID
        L5_1 = L5_1(L6_1)
        if not L5_1 then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        end
        L6_1 = mp
        L6_1 = L6_1.GetProcessCommandLine
        L7_1 = L5_1
        L6_1 = L6_1(L7_1)
        if not L6_1 then
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          return L7_1
        end
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = L6_1
        L7_1 = L7_1(L8_1)
        L6_1 = L7_1
        L7_1 = #L6_1
        if L7_1 < 70 then
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          return L7_1
        end
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = L6_1
        L9_1 = "http"
        L10_1 = 1
        L11_1 = true
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if not L7_1 then
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          return L7_1
        end
        L7_1 = MpCommon
        L7_1 = L7_1.StringRegExpSearch
        L8_1 = "(https?:\\/\\/[^^\\s\\x22\\x27\\x7C\\x29\\x3B\\x3E\\x3C\\x2C\\x5E\\x60\\x5D\\x7D]+)"
        L9_1 = L6_1
        L7_1, L8_1 = L7_1(L8_1, L9_1)
        if not L7_1 then
          L9_1 = mp
          L9_1 = L9_1.CLEAN
          return L9_1
        end
        if not L8_1 then
          L9_1 = mp
          L9_1 = L9_1.CLEAN
          return L9_1
        end
        L9_1 = ExtractPartsFromUri
        L10_1 = L8_1
        L9_1 = L9_1(L10_1)
        if L9_1 == "" or L9_1 == nil then
          L10_1 = mp
          L10_1 = L10_1.CLEAN
          return L10_1
        end
        L10_1 = L9_1.host
        if L10_1 ~= "" then
          L10_1 = L9_1.host
          if L10_1 ~= nil then
            goto lbl_115
          end
        end
        L10_1 = mp
        L10_1 = L10_1.CLEAN
        do return L10_1 end
        ::lbl_115::
        L10_1 = split
        L11_1 = L9_1.host
        L12_1 = "%."
        L10_1 = L10_1(L11_1, L12_1)
        if not L10_1 then
          L11_1 = mp
          L11_1 = L11_1.CLEAN
          return L11_1
        end
        L11_1 = "."
        L12_1 = tostring
        L13_1 = #L10_1
        L13_1 = L10_1[L13_1]
        L12_1 = L12_1(L13_1)
        L11_1 = L11_1 .. L12_1
        if not L11_1 then
          L12_1 = mp
          L12_1 = L12_1.CLEAN
          return L12_1
        end
        L12_1 = isSuspTLD
        L13_1 = L11_1
        L12_1 = L12_1(L13_1)
        if not L12_1 then
          L12_1 = mp
          L12_1 = L12_1.CLEAN
          return L12_1
        end
        L12_1 = mp
        L12_1 = L12_1.GetParentProcInfo
        L13_1 = L5_1
        L12_1 = L12_1(L13_1)
        if L12_1 ~= nil then
          L13_1 = L12_1.image_path
          if L13_1 ~= nil then
            L13_1 = string
            L13_1 = L13_1.lower
            L14_1 = L12_1.image_path
            L13_1 = L13_1(L14_1)
            L15_1 = L13_1
            L14_1 = L13_1.match
            L16_1 = "([^\\]+)$"
            L14_1 = L14_1(L15_1, L16_1)
            L15_1 = {}
            L15_1["explorer.exe"] = true
            L16_1 = L15_1[L14_1]
            if L16_1 then
              L16_1 = mp
              L16_1 = L16_1.INFECTED
              return L16_1
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
