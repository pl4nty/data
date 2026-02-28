local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L0_1 ~= "cscript.exe" and L0_1 ~= "wscript.exe " then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = ""
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_SCANREASON
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.SCANREASON_AMSI
if L2_1 == L3_1 then
  L3_1 = pcall
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_AMSI_CONTENTNAME
  L3_1, L4_1 = L3_1(L4_1, L5_1)
  if L3_1 and L4_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L1_1 = L5_1
  end
end
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L3_1 = mp
L3_1 = L3_1.GetMotwZoneForFile
L4_1 = L1_1
L3_1, L4_1 = L3_1(L4_1)
L5_1 = mp
L5_1 = L5_1.GetMotwHostUrlForFile
L6_1 = L1_1
L5_1, L6_1 = L5_1(L6_1)
if not L1_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L1_1
L7_1 = L7_1(L8_1)
L1_1 = L7_1
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
if L4_1 ~= 3 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L6_1 ~= "about:internet" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L8_1 = L1_1
L7_1 = L1_1.find
L9_1 = "\\downloads\\"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if not L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
