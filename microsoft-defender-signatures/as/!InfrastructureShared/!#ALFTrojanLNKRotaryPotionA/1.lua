-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:LNK/RotaryPotion.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_LNK_FILE

local l_0_0 = mp.GetLnkInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.BasePath or ""
if l_0_1 == "" then
  l_0_1 = l_0_0.RelativePath or ""
end
if l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
if string.find(l_0_1, "\\system32\\ftp.exe", 1, true) == nil and string.find(l_0_1, "\\ftp.exe", 1, true) == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0.Arguments or nil
if l_0_2 == nil then
  return mp.CLEAN
end
if string.find(l_0_2, "-s\"\":_/%w/%w/%w") == nil then
  return mp.CLEAN
end
return mp.INFECTED
