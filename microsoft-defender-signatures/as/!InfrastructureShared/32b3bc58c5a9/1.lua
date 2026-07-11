-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3bc58c5a9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = "memPagesMetadata_" .. l_0_0.ppid
local l_0_2 = GetRollingQueueKeyValue(l_0_1, "data")
if not l_0_2 then
  return mp.CLEAN
end
;
(bm.add_related_string)("memRegionsMetadata", l_0_2, bm.RelatedStringBMReport)
return mp.INFECTED

