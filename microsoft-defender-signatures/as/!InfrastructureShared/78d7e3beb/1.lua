local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "trustedinstaller\\sbinpath\\s*=([^&]+)"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "\\servicing\\trustedinstaller.exe"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L3_1 = L3_1()
if L3_1 ~= nil then
  L4_1 = L3_1.image_path
  if L4_1 == "" or L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = ":\\lenovoquickfix\\"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = L3_1.ppid
  if L5_1 == "" or L5_1 == nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = mp
  L6_1 = L6_1.GetProcessCommandLine
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if L6_1 == "" or L6_1 == nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L6_1 = L7_1
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L6_1
  L9_1 = ":\\lenovoquickfix\\"
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L6_1
  L9_1 = "trustedinstaller\\sbinpath\\s*=([^&]+)"
  L7_1 = L7_1(L8_1, L9_1)
  L2_1 = L7_1
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L2_1
  L9_1 = "\\servicing\\trustedinstaller.exe"
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L4_1 = mp
L4_1 = L4_1.LOWFI
return L4_1
