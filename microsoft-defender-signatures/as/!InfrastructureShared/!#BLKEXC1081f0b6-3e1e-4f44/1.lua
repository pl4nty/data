local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "1081f0b6-3e1e-4f44-acce-816d65112d99"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = false
  return L0_1
end
L0_1 = versioning
L0_1 = L0_1.GetTestMode
L0_1 = L0_1()
if L0_1 ~= 53019 then
  L0_1 = versioning
  L0_1 = L0_1.GetOrgID
  L0_1 = L0_1()
  if L0_1 == nil then
    L1_1 = false
    return L1_1
  end
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
  if L0_1 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" then
    L1_1 = false
    return L1_1
  end
end
L0_1 = ImageConfig
L0_1 = L0_1.GetImagePath
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = false
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = false
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = IsRmmToolFilePath
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == true then
  L2_1 = true
  return L2_1
end
L2_1 = IsRmmToolVersionInfo
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == true then
  L2_1 = true
  return L2_1
end
L2_1 = IsRmmToolOFN
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == true then
  L2_1 = true
  return L2_1
end
L2_1 = false
return L2_1
