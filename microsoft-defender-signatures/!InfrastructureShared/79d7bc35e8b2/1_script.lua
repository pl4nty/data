-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\79d7bc35e8b2\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
l_0_1 = (string.gsub)(l_0_1, "\'", "\"")
l_0_1 = (string.gsub)(l_0_1, "\"\"", "\"")
local l_0_2 = l_0_1:match("ip%s+(.+)$")
if not l_0_2 then
  return mp.CLEAN
end
if IsHostAttackServerCloudChk(l_0_2, "PowershellCmdline", "powershell", l_0_1, "test") then
  return mp.INFECTED
end
return mp.CLEAN

