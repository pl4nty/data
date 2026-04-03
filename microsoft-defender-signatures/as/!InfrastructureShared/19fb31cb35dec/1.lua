-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19fb31cb35dec\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p1 == nil then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p1)
local l_0_1 = (string.lower)((this_sigattrlog[4]).utf8p1)
local l_0_2 = (bm.get_imagepath)()
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_2, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_2, "\\windows\\installer\\", 1, true) or (string.find)(l_0_2, "\\windows\\temp\\", 1, true) then
  return mp.CLEAN
end
;
(bm.add_related_file)(l_0_0)
;
(bm.add_related_file)(l_0_1)
TrackPidAndTechniqueBM("BM", "T1218.015", "ElectronLokiDeploy")
return mp.INFECTED

