-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaUPXDrop\0x00001d70_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 then
  (MpCommon.BmTriggerSig)(l_0_1, "BM_UPXDrop", l_0_0)
end
taint(l_0_0, "upx_file_created_taint", 3600)
return mp.INFECTED

