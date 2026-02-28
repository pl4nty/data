local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
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
        L6_1 = L6_1.getfilesize
        L6_1 = L6_1()
        if 450 < L6_1 then
          L7_1 = mp
          L7_1 = L7_1.CLEAN
          return L7_1
        end
        L7_1 = mp
        L7_1 = L7_1.GetProcessCommandLine
        L8_1 = L5_1
        L7_1 = L7_1(L8_1)
        if not L7_1 then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
        end
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = L7_1
        L8_1 = L8_1(L9_1)
        L7_1 = L8_1
        L8_1 = #L7_1
        if L8_1 < 50 then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
        end
        L8_1 = #L7_1
        if 450 < L8_1 then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
        end
        L8_1 = extract_urls
        L9_1 = L7_1
        L8_1, L9_1 = L8_1(L9_1)
        L10_1 = isnull
        L11_1 = L9_1
        L10_1 = L10_1(L11_1)
        if L10_1 then
          L10_1 = mp
          L10_1 = L10_1.CLEAN
          return L10_1
        end
        L10_1 = ipairs
        L11_1 = L9_1
        L10_1, L11_1, L12_1 = L10_1(L11_1)
        for L13_1, L14_1 in L10_1, L11_1, L12_1 do
          L15_1 = split
          L16_1 = L14_1
          L17_1 = "%."
          L15_1 = L15_1(L16_1, L17_1)
          if not L15_1 then
            L16_1 = mp
            L16_1 = L16_1.CLEAN
            return L16_1
          end
          L16_1 = "."
          L17_1 = tostring
          L18_1 = #L15_1
          L18_1 = L15_1[L18_1]
          L17_1 = L17_1(L18_1)
          L16_1 = L16_1 .. L17_1
          if not L16_1 then
            L17_1 = mp
            L17_1 = L17_1.CLEAN
            return L17_1
          end
          L17_1 = isSuspTLD
          L18_1 = L16_1
          L17_1 = L17_1(L18_1)
          if L17_1 then
            L17_1 = mp
            L17_1 = L17_1.GetParentProcInfo
            L18_1 = L5_1
            L17_1 = L17_1(L18_1)
            if L17_1 ~= nil then
              L18_1 = L17_1.image_path
              if L18_1 ~= nil then
                L18_1 = string
                L18_1 = L18_1.lower
                L19_1 = L17_1.image_path
                L18_1 = L18_1(L19_1)
                L20_1 = L18_1
                L19_1 = L18_1.match
                L21_1 = "([^\\]+)$"
                L19_1 = L19_1(L20_1, L21_1)
                L20_1 = {}
                L20_1["explorer.exe"] = true
                L20_1["powershell.exe"] = true
                L20_1["cmd.exe"] = true
                L21_1 = L20_1[L19_1]
                if L21_1 then
                  L21_1 = mp
                  L21_1 = L21_1.INFECTED
                  return L21_1
                end
              end
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
