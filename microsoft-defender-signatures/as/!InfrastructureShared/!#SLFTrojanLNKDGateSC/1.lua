-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:LNK/DGate.SC
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: BM_LNK_FILE

local l_0_0 = mp.GetLnkInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.RelativePath or nil
if not contains(l_0_1, "..\\..\\") then
  return mp.CLEAN
end
if not StringEndsWith(l_0_1, "\\cmd.exe") and not StringEndsWith(l_0_1, "\\powershell.exe") then
  return mp.CLEAN
end
local l_0_2 = l_0_0.IconIndex or nil
if l_0_2 ~= 0 and l_0_2 ~= 1 then
  return mp.CLEAN
end
local l_0_3 = l_0_0.IconLocation or nil
if l_0_3 ~= nil and StringEndsWith(l_0_3, ".pdf") then
  return mp.INFECTED
end
return mp.CLEAN
