-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\170b321567544\1.luac 

-- params : ...
-- function num : 0
if (((this_sigattrlog[2] ~= nil and (this_sigattrlog[2]).matched) or (this_sigattrlog[3] ~= nil and (this_sigattrlog[3]).matched) or (this_sigattrlog[4] ~= nil and (this_sigattrlog[4]).matched) or IsWinRMSessionForPpid("BM", nil, nil) or not IsWinRMSessionFoundInParents("BM", nil, 4, nil))) then
  return mp.CLEAN
end
if not (this_sigattrlog[5]).matched and not (this_sigattrlog[6]).matched then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p2) then
  l_0_0 = (this_sigattrlog[5]).utf8p2
else
  if (this_sigattrlog[6]).matched and not isnull((this_sigattrlog[6]).utf8p2) then
    l_0_0 = (this_sigattrlog[6]).utf8p2
  end
end
if not isnull(l_0_0) then
  (bm.add_related_string)("winrm_blocked_threat", l_0_0, bm.RelatedStringBMReport)
end
;
(bm.add_related_string)("winrm_context", "WinRMSessionTracking", bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMRemoteLsassDump")
TrackPidAndTechniqueBM("BM", "T1003.001", "WinRMRemoteLsassDump")
return mp.INFECTED

