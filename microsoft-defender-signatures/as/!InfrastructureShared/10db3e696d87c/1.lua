-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10db3e696d87c\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[3]).matched and not (this_sigattrlog[4]).matched then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if not (string.find)(l_0_0, "\\wsmprovhost.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[3]).matched and not isnull((this_sigattrlog[3]).utf8p2) then
  l_0_1 = (this_sigattrlog[3]).utf8p2
else
  if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p2) then
    l_0_1 = (this_sigattrlog[4]).utf8p2
  end
end
if not isnull(l_0_1) then
  (bm.add_related_string)("winrm_blocked_threat", l_0_1, bm.RelatedStringBMReport)
end
;
(bm.add_related_string)("winrm_remote_host", "wsmprovhost", bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "SuspRemoteLsassDumpViaWinRM")
TrackPidAndTechniqueBM("BM", "T1003.001", "SuspRemoteLsassDumpViaWinRM")
return mp.INFECTED

