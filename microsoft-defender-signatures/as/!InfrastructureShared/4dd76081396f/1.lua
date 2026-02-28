local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
L2_1 = nil
if L1_1 then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "wscript.*%s+%\"?%'?(%w:\\.*%.js)"
  L3_1 = L3_1(L4_1, L5_1)
  L2_1 = L3_1
end
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = false
L4_1 = GetRollingQueue
L5_1 = "LuaHighRiskJSinZipWebVector"
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = type
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 == "table" then
    L5_1 = pairs
    L6_1 = L4_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1 in L5_1, L6_1, L7_1 do
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L2_1
      L11_1 = L4_1[L8_1]
      L11_1 = L11_1.key
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 then
        L3_1 = true
      end
    end
  end
end
if L3_1 then
  L5_1 = mp
  L5_1 = L5_1.GetParentProcInfo
  L5_1 = L5_1()
  if L5_1 ~= nil then
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L5_1.image_path
    L6_1 = L6_1(L7_1)
    L8_1 = L6_1
    L7_1 = L6_1.match
    L9_1 = "([^\\]+)$"
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 == "explorer.exe" then
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
