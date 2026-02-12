-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\101b34b510e0b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
if not (this_sigattrlog[3]).matched then
  return mp.CLEAN
end
if (this_sigattrlog[3]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((this_sigattrlog[3]).utf8p1)
if (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  l_0_2 = (string.lower)((this_sigattrlog[4]).utf8p1)
else
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
    l_0_2 = (string.lower)((this_sigattrlog[5]).utf8p1)
  end
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (string.match)(l_0_1, "\\([^\\]+)$")
if l_0_3 == nil then
  return mp.CLEAN
end
if not (string.find)(l_0_2, l_0_3, 1, true) then
  return mp.CLEAN
end
;
(bm.add_related_file)(l_0_1)
TrackFileAndTechnique(l_0_1, "T1562.001:av_exclusion_self_protect", 1000)
TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_excl_self_protect")
return mp.INFECTED

