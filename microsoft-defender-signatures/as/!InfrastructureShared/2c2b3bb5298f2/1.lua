-- Threat: !InfrastructureShared
-- Name: 2c2b3bb5298f2
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = "unknown"
if this_sigattrlog[2].matched then
  l_0_2 = "w3wp"
elseif this_sigattrlog[3].matched then
  l_0_2 = "node"
elseif this_sigattrlog[4].matched then
  l_0_2 = "httpd"
end
local l_0_3
local l_0_4 = ""
if not isnull(this_sigattrlog[5]) and this_sigattrlog[5].matched then
  l_0_3 = "ps_invoke_command"
  if not isnull(this_sigattrlog[5].utf8p2) then
    l_0_4 = string.lower(this_sigattrlog[5].utf8p2)
  end
elseif not isnull(this_sigattrlog[11]) and this_sigattrlog[11].matched then
  l_0_3 = "winrs_remote"
  if not isnull(this_sigattrlog[11].utf8p2) then
    l_0_4 = string.lower(this_sigattrlog[11].utf8p2)
  end
else
  l_0_3 = "ps_session"
end
if string.find(l_0_4, "localhost", 1, true) or string.find(l_0_4, "127.", 1, true) or string.find(l_0_4, "::1", 1, true) then
  return mp.CLEAN
end
WinRMSessionTrackProcess("BM", nil, "Client")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMSessionProcess.A")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMClientProcess.A")
bm.add_related_string("WebSvrWinRM_server", l_0_2, bm.RelatedStringBMReport)
bm.add_related_string("WebSvrWinRM_hop", l_0_3, bm.RelatedStringBMReport)
bm.add_related_string("WebSvrWinRM_cmd", l_0_4, bm.RelatedStringBMReport)
bm.add_related_string("WebSvrWinRM_img", l_0_1, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WebSvrWinRM")
add_parents()
return mp.INFECTED
