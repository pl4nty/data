-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55d7a7e64636\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 7 then
  return mp.CLEAN
end
l_0_1 = normalize_path(l_0_1)
if l_0_1 == nil or #l_0_1 <= 7 then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.GetOriginalFileName)(l_0_1)
if l_0_2 == nil and #l_0_2 <= 10 then
  return mp.CLEAN
end
if (string.lower)(l_0_2) == "bm_renpy_exe" then
  return mp.INFECTED
end
return mp.CLEAN

