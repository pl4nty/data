-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c2b3bb5298f2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
local l_0_2 = "unknown"
if (this_sigattrlog[2]).matched then
  l_0_2 = "w3wp"
else
  if (this_sigattrlog[3]).matched then
    l_0_2 = "node"
  else
    if (this_sigattrlog[4]).matched then
      l_0_2 = "httpd"
    end
  end
end
local l_0_3 = nil
local l_0_4 = ""
if not isnull(this_sigattrlog[5]) and (this_sigattrlog[5]).matched then
  l_0_3 = "ps_invoke_command"
  if not isnull((this_sigattrlog[5]).utf8p2) then
    l_0_4 = (string.lower)((this_sigattrlog[5]).utf8p2)
  end
else
  if not isnull(this_sigattrlog[11]) and (this_sigattrlog[11]).matched then
    l_0_3 = "winrs_remote"
    if not isnull((this_sigattrlog[11]).utf8p2) then
      l_0_4 = (string.lower)((this_sigattrlog[11]).utf8p2)
    end
  else
    l_0_3 = "ps_session"
  end
end
if (string.find)(l_0_4, "localhost", 1, true) or (string.find)(l_0_4, "127.", 1, true) or (string.find)(l_0_4, "::1", 1, true) then
  return mp.CLEAN
end
;
(bm.add_related_string)("WebSvrWinRM_server", l_0_2, bm.RelatedStringBMReport)
;
(bm.add_related_string)("WebSvrWinRM_hop", l_0_3, bm.RelatedStringBMReport)
;
(bm.add_related_string)("WebSvrWinRM_cmd", l_0_4, bm.RelatedStringBMReport)
;
(bm.add_related_string)("WebSvrWinRM_img", l_0_1, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "SuspWebSvrWinRM")
add_parents()
return mp.INFECTED

