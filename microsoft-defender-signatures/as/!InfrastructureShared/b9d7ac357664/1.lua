local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = sysio
L0_1 = L0_1.RegExpandUserKey
L1_1 = "HKCU\\Environment"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = pairs
  L2_1 = L0_1
  L1_1, L2_1, L3_1 = L1_1(L2_1)
  for L4_1, L5_1 in L1_1, L2_1, L3_1 do
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = L5_1
    L7_1 = L7_1(L8_1)
    L8_1 = "hkcu@s-1-5-21-"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 then
      L6_1 = sysio
      L6_1 = L6_1.RegOpenKey
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if L6_1 then
        L7_1 = sysio
        L7_1 = L7_1.GetRegValueAsString
        L8_1 = L6_1
        L9_1 = "COR_PROFILER"
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 then
          L8_1 = sysio
          L8_1 = L8_1.GetRegValueAsString
          L9_1 = L6_1
          L10_1 = "COR_PROFILER_PATH"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 then
            L9_1 = set_research_data
            L10_1 = "cor_prof_path"
            L11_1 = L8_1
            L12_1 = false
            L9_1(L10_1, L11_1, L12_1)
            L9_1 = mp
            L9_1 = L9_1.INFECTED
            return L9_1
          end
          L9_1 = string
          L9_1 = L9_1.match
          L10_1 = L5_1
          L11_1 = "(HKCU.-)\\"
          L9_1 = L9_1(L10_1, L11_1)
          if L9_1 then
            L10_1 = L9_1
            L11_1 = "\\Software\\Classes\\CLSID\\"
            L12_1 = L7_1
            L13_1 = "\\InprocServer32"
            L10_1 = L10_1 .. L11_1 .. L12_1 .. L13_1
            L11_1 = sysio
            L11_1 = L11_1.RegOpenKey
            L12_1 = L10_1
            L11_1 = L11_1(L12_1)
            if L11_1 then
              L12_1 = sysio
              L12_1 = L12_1.GetRegValueAsString
              L13_1 = L11_1
              L14_1 = ""
              L12_1 = L12_1(L13_1, L14_1)
              if L12_1 then
                L13_1 = string
                L13_1 = L13_1.len
                L14_1 = L12_1
                L13_1 = L13_1(L14_1)
                if L13_1 < 4 then
                  L13_1 = string
                  L13_1 = L13_1.lower
                  L14_1 = L12_1
                  L13_1 = L13_1(L14_1)
                  if L13_1 ~= "cmd" then
                    L13_1 = mp
                    L13_1 = L13_1.CLEAN
                    return L13_1
                  end
                end
                L13_1 = set_research_data
                L14_1 = "inprocserver32"
                L15_1 = L12_1
                L16_1 = false
                L13_1(L14_1, L15_1, L16_1)
                L13_1 = mp
                L13_1 = L13_1.set_mpattribute
                L14_1 = "MpDisableCaching"
                L13_1(L14_1)
                L13_1 = mp
                L13_1 = L13_1.INFECTED
                return L13_1
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
