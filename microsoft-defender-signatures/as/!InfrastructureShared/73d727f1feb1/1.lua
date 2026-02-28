local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = #L1_1
if L2_1 < 70 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "MpCmdLineFoundB64"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = L2_1.image_path
  if L3_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1.image_path
L3_1 = L3_1(L4_1)
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "([^\\]+)$"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= "explorer.exe" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = {}
L6_1 = "tinyurl.com"
L7_1 = ".replace("
L8_1 = "discord.com-api-webhooks"
L9_1 = ")|iex;"
L10_1 = "habilitar"
L11_1 = "captcha"
L12_1 = "cl\204\178o\204\178u\204\178d\204\178f\204\178l\204\178a\204\178r\204\178e\204\178\194\169_ve\204\178r\204\178i\204\178f\204\178i\204\178c\204\178a\204\178t\204\178i\204\178o\204\178n\204\178"
L13_1 = "human"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L5_1[5] = L10_1
L5_1[6] = L11_1
L5_1[7] = L12_1
L5_1[8] = L13_1
L4_1 = L5_1
L5_1 = contains
L6_1 = L1_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
