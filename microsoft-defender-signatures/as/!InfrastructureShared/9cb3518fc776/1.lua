-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb3518fc776\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[4]).matched then
  return mp.CLEAN
end
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if l_0_0 then
  (bm.add_related_file)(l_0_0)
end
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 and next(l_0_1) and l_0_1.command_line then
  (bm.add_related_string)("MSI_CHILD_CMDLINE", l_0_1.command_line, bm.RelatedStringBMReport)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1219", "SuspAnydeskMsiInstall.A!ofn")
return mp.INFECTED

