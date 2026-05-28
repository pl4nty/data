-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\91b39ed34efd\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or not (this_sigattrlog[2]).utf8p2 then
  return mp.CLEAN
end
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if l_0_0 then
  (bm.add_related_file)(l_0_0)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1219", "SuspAnydeskUnattended.A!ofn")
return mp.INFECTED

