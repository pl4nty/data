-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c6b3044f2310\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((bm.get_current_process_startup_info)()).ppid
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, ".js", 1, true) == nil then
  return mp.INFECTED
end
bm_AddRelatedFileFromCommandLine("BM")
return mp.INFECTED

