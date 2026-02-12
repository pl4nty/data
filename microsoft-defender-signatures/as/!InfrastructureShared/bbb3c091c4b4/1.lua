-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bbb3c091c4b4\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
if (this_sigattrlog[1]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[1]).utf8p1
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
;
(bm.add_related_file)(l_0_0)
TrackFileAndTechnique(l_0_0, "T1574.001:printnotify_dll_hijack_generic", 1000)
TrackPidAndTechniqueBM("BM", "T1543.003", "printnotify_svc_hijack_generic")
return mp.INFECTED

