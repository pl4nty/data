local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1.image_path
  L3_1 = L3_1(L4_1)
  L4_1 = mp
  L4_1 = L4_1.GetProcessCommandLine
  L5_1 = L2_1.ppid
  L4_1 = L4_1(L5_1)
  L5_1 = {}
  L6_1 = "python.exe"
  L5_1[1] = L6_1
  L6_1 = {}
  L7_1 = "bootstrap5"
  L6_1[1] = L7_1
  L7_1 = contains
  L8_1 = L3_1
  L9_1 = L5_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = contains
  L8_1 = L4_1
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L3_1 = {}
L4_1 = "(?:set|add)-mppreference\\s+-exclusionpath\\s+c:\\\\\\s*$"
L5_1 = "(?:set|add)-mppreference\\s+-exclusionpath\\s+['\"]c:\\\\['\"]\\s*$"
L6_1 = "(?:set|add)-mppreference\\s+-exclusionpath\\s+c:\\\\\\s*[,;]['\"]?\\s*\\w?"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L4_1 = false
L5_1 = ipairs
L6_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = MpCommon
  L10_1 = L10_1.StringRegExpSearch
  L11_1 = L9_1
  L12_1 = L1_1
  L10_1, L11_1 = L10_1(L11_1, L12_1)
  L8_1 = L11_1
  L4_1 = L10_1
  if L4_1 then
    L10_1 = versioning
    L10_1 = L10_1.IsSeville
    L10_1 = L10_1()
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    else
      L10_1 = mp
      L10_1 = L10_1.LOWFI
      return L10_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
