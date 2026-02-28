local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = sysio
L0_1 = L0_1.RegExpandUserKey
L1_1 = "HKCU\\Software\\Classes\\Ms-Settings\\Shell\\Open\\Command"
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
        L9_1 = ""
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 then
          L8_1 = string
          L8_1 = L8_1.len
          L9_1 = L7_1
          L8_1 = L8_1(L9_1)
          if L8_1 < 4 then
            L8_1 = string
            L8_1 = L8_1.lower
            L9_1 = L7_1
            L8_1 = L8_1(L9_1)
            if L8_1 ~= "cmd" then
              L8_1 = mp
              L8_1 = L8_1.CLEAN
              return L8_1
            end
          end
          L8_1 = set_research_data
          L9_1 = "DefaultValue"
          L10_1 = L7_1
          L11_1 = false
          L8_1(L9_1, L10_1, L11_1)
          L8_1 = mp
          L8_1 = L8_1.GetScannedPPID
          L8_1 = L8_1()
          L9_1 = {}
          L10_1 = table
          L10_1 = L10_1.insert
          L11_1 = L9_1
          L12_1 = L8_1
          L10_1(L11_1, L12_1)
          L10_1 = MpCommon
          L10_1 = L10_1.SetPersistContextNoPath
          L11_1 = "UACBypassRegSet.A"
          L12_1 = L9_1
          L13_1 = 5
          L10_1(L11_1, L12_1, L13_1)
          L10_1 = mp
          L10_1 = L10_1.set_mpattribute
          L11_1 = "MpDisableCaching"
          L10_1(L11_1)
          L10_1 = mp
          L10_1 = L10_1.INFECTED
          return L10_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
