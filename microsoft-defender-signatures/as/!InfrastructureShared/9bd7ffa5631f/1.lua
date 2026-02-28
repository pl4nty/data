local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.image_path
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= "sdclt.exe" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = sysio
L2_1 = L2_1.RegExpandUserKey
L3_1 = "HKCU\\Software\\CLASSES\\FOLDER\\SHELL\\OPEN\\COMMAND"
L2_1 = L2_1(L3_1)
if L2_1 then
  L3_1 = pairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = string
    L9_1 = L9_1.lower
    L10_1 = L7_1
    L9_1 = L9_1(L10_1)
    L10_1 = "hkcu@s-1-5-21-"
    L11_1 = 1
    L12_1 = true
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if L8_1 then
      L8_1 = sysio
      L8_1 = L8_1.RegOpenKey
      L9_1 = L7_1
      L8_1 = L8_1(L9_1)
      if L8_1 then
        L9_1 = sysio
        L9_1 = L9_1.GetRegValueAsString
        L10_1 = L8_1
        L11_1 = ""
        L9_1 = L9_1(L10_1, L11_1)
        if L9_1 then
          L10_1 = string
          L10_1 = L10_1.len
          L11_1 = L9_1
          L10_1 = L10_1(L11_1)
          if L10_1 < 4 then
            L10_1 = string
            L10_1 = L10_1.lower
            L11_1 = L9_1
            L10_1 = L10_1(L11_1)
            if L10_1 ~= "cmd" then
              L10_1 = mp
              L10_1 = L10_1.CLEAN
              return L10_1
            end
          end
          L10_1 = set_research_data
          L11_1 = "DefaultValue"
          L12_1 = L9_1
          L13_1 = false
          L10_1(L11_1, L12_1, L13_1)
          L10_1 = mp
          L10_1 = L10_1.GetScannedPPID
          L10_1 = L10_1()
          L11_1 = {}
          L12_1 = table
          L12_1 = L12_1.insert
          L13_1 = L11_1
          L14_1 = L10_1
          L12_1(L13_1, L14_1)
          L12_1 = MpCommon
          L12_1 = L12_1.SetPersistContextNoPath
          L13_1 = "UACBypassRegSet.A"
          L14_1 = L11_1
          L15_1 = 5
          L12_1(L13_1, L14_1, L15_1)
          L12_1 = mp
          L12_1 = L12_1.set_mpattribute
          L13_1 = "MpDisableCaching"
          L12_1(L13_1)
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          return L12_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
