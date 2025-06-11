-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\16dd7c0fb7ec0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if #l_0_3 < 50 then
  return mp.CLEAN
end
if #l_0_3 > 400 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = (MpCommon.StringRegExpSearch)("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|minimized)\\s+", l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_6 = "\\:?\\s*\\d{4,}[\\\"\'\\s]*$"
if (MpCommon.StringRegExpSearch)(l_0_6, l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN

