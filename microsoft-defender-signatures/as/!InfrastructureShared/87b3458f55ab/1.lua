-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\87b3458f55ab\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or not (this_sigattrlog[2]).utf8p2 then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
if not (string.find)(l_0_0, "--silent", 1, true) then
  return mp.CLEAN
end
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
;
(bm.add_related_string)("INSTALL_CMDLINE", (this_sigattrlog[2]).utf8p2, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1219", "SuspAnydeskInstall.A!ofn")
return mp.INFECTED

