-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!ProcDumpA2\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetCurrentPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = GetRollingQueueKeyValue("memPagesMetadata", "PPID")
if not l_0_1 or tonumber(l_0_1) ~= l_0_0 then
  return mp.CLEAN
end
if getScannedRegions() == 0 then
  return mp.INFECTED
end
return mp.CLEAN

