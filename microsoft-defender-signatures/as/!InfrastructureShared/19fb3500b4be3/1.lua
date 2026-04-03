-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19fb3500b4be3\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p1 == nil then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil then
  return mp.CLEAN
end
;
(bm.add_related_file)((this_sigattrlog[1]).utf8p1)
;
(bm.add_related_file)((this_sigattrlog[4]).utf8p1)
TrackPidAndTechniqueBM("BM", "T1218.015", "ElectronLokiDeployXP")
return mp.INFECTED

