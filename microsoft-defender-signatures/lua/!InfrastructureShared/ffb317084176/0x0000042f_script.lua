-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ffb317084176\0x0000042f_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not (this_sigattrlog[1]).matched or isnull((this_sigattrlog[1]).utf8p1) or isnull((this_sigattrlog[1]).utf8p2) or isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
l_0_0 = l_0_0.ppid
local l_0_1 = (this_sigattrlog[1]).utf8p2
local l_0_2, l_0_3, l_0_4 = (string.match)((this_sigattrlog[1]).utf8p1, "ProcessReparent (.-) from .- to (.-) as new parent of: (.+)")
if isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = nil
if l_0_2 == "injected" then
  l_0_5 = l_0_1
else
  if (this_sigattrlog[3]).matched and not isnull((this_sigattrlog[3]).utf8p1) then
    l_0_5 = (this_sigattrlog[3]).utf8p1
  else
    if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p1) then
      l_0_5 = (this_sigattrlog[4]).utf8p1
    else
      if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p1) then
        l_0_5 = (this_sigattrlog[5]).utf8p1
      else
        if (this_sigattrlog[6]).matched and not isnull((this_sigattrlog[6]).utf8p1) then
          l_0_5 = (this_sigattrlog[6]).utf8p1
        end
      end
    end
  end
end
if isnull(l_0_5) or l_0_5 ~= l_0_1 then
  return mp.CLEAN
end
;
(bm.add_related_string)("ProcessSpoofSummary", (string.format)("This process %s %s to spoof as parent of %s.", l_0_2, l_0_3, l_0_4), bm.RelatedStringBMReport)
;
(bm.add_related_process)(l_0_4)
TrackPidAndTechniqueBM(l_0_4, "T1564.010", "spoofargs_child")
TrackPidAndTechniqueBM(l_0_4, "T1134.004", "spoofparent_child")
;
(bm.add_related_process)(l_0_3)
TrackPidAndTechniqueBM(l_0_3, "T1564.010", "spoofargs_fakeparent")
TrackPidAndTechniqueBM(l_0_3, "T1134.004", "spoofparent_fakeparent")
TrackPidAndTechniqueBM(l_0_0, "T1564.010", "spoofargs_realparent")
TrackPidAndTechniqueBM(l_0_0, "T1134.004", "spoofparent_realparent")
return mp.INFECTED

