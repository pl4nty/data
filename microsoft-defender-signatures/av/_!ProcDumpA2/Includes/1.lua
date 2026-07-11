-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!ProcDumpA2\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetCurrentPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = "memPagesMetadata_" .. l_0_0
local l_0_2 = GetRollingQueueKeyValue(l_0_1, "PPID")
if not l_0_2 then
  return mp.CLEAN
end
if l_0_2 ~= l_0_0 then
  return mp.CLEAN
end
local l_0_3 = GetRollingQueueKeyValue(l_0_1, "sig_matched")
if getScannedRegions(l_0_3, l_0_1) == 0 then
  return mp.SUSPICIOUS
end
return mp.CLEAN

