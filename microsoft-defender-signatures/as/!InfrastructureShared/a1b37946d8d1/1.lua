-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a1b37946d8d1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
local l_0_1 = this_sigattrlog[3]
if not l_0_0.matched or not l_0_1.matched then
  return mp.CLEAN
end
if l_0_0.utf8p1 == nil or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_2 = normalize_path((string.lower)(l_0_0.utf8p1))
if type(l_0_2) ~= "string" then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(MpCommon.CommandLineToArgv, l_0_0.utf8p2)
if not l_0_3 or type(l_0_4) ~= "table" then
  return mp.CLEAN
end
local l_0_5 = l_0_4[2]
if type(l_0_5) ~= "string" then
  return mp.CLEAN
end
local l_0_6 = l_0_5
if l_0_5 == "-f" or l_0_5 == "--file" then
  l_0_6 = l_0_4[3]
else
  if l_0_5:sub(1, 7) == "--file=" then
    l_0_6 = l_0_5:sub(8)
  else
    if l_0_5:sub(1, 1) == "-" then
      return mp.CLEAN
    end
  end
end
if type(l_0_6) ~= "string" then
  return mp.CLEAN
end
if ((string.lower)(l_0_6)):sub(-4) ~= ".php" then
  return mp.CLEAN
end
local l_0_7 = GetRealPidForScenario("BM")
if type(l_0_7) ~= "string" or l_0_7:sub(1, 4) ~= "pid:" then
  return mp.CLEAN
end
local l_0_8 = (mp.GetParentProcInfo)(l_0_7)
if l_0_8 == nil or l_0_8.ppid == nil or l_0_8.image_path == nil then
  return mp.CLEAN
end
local l_0_9 = normalize_path((string.lower)(l_0_8.image_path))
if type(l_0_9) ~= "string" then
  return mp.CLEAN
end
local l_0_10 = l_0_2:match("^(.*)\\[^\\]+$")
local l_0_11 = l_0_9:match("^(.*)\\[^\\]+$")
if l_0_10 == nil or l_0_11 ~= l_0_10 then
  return mp.CLEAN
end
local l_0_12 = (mp.GetParentProcInfo)(l_0_8.ppid)
if l_0_12 == nil or l_0_12.ppid == nil or l_0_12.image_path == nil then
  return mp.CLEAN
end
local l_0_13 = (string.lower)(l_0_12.image_path)
if l_0_13:sub(-12) ~= "\\svchost.exe" then
  return mp.CLEAN
end
local l_0_14 = (mp.GetProcessCommandLine)(l_0_12.ppid)
if type(l_0_14) ~= "string" then
  return mp.CLEAN
end
local l_0_15, l_0_16 = pcall(MpCommon.CommandLineToArgv, l_0_14)
if not l_0_15 or type(l_0_16) ~= "table" then
  return mp.CLEAN
end
local l_0_17 = nil
for l_0_21 = 2, #l_0_16 do
  if l_0_16[l_0_21] == "-s" then
    if l_0_17 ~= nil or type(l_0_16[l_0_21 + 1]) ~= "string" then
      return mp.CLEAN
    end
    l_0_17 = (string.lower)(l_0_16[l_0_21 + 1])
  end
end
if l_0_17 ~= "schedule" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1059", "SuspScheduledRoamingPhpNetwork.A")
return mp.INFECTED

