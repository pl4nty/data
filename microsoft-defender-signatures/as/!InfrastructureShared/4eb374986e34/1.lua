-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4eb374986e34\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p1)
if (string.find)(l_0_0, "/node_modules/", 1, true) then
  return mp.CLEAN
end
;
(bm.add_related_file)((this_sigattrlog[1]).utf8p1)
TrackPidAndTechniqueBM("BM", "T1218.015", "SuspElectronNodeLoadXP")
return mp.INFECTED

