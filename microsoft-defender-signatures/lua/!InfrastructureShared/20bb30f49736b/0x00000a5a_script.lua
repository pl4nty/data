-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\20bb30f49736b\0x00000a5a_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged_mt2023", 300)
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.ppid == "" then
  return mp.CLEAN
end
local l_0_1 = GetTacticsTableForPid(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = 0
for l_0_6,l_0_7 in pairs(l_0_1) do
  if (string.find)(l_0_6, "mt2023", 1, true) then
    l_0_2 = l_0_2 + 1
  end
end
if l_0_2 > 2 then
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN

