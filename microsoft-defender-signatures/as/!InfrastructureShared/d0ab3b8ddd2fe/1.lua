-- Threat: !InfrastructureShared
-- Name: d0ab3b8ddd2fe
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.ppid == "" or l_0_1.command_line == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
local l_0_3 = l_0_2
l_0_3 = string.lower(l_0_3)
if string.find(l_0_2, "/etc/xdg/chk", 1, true) ~= nil or string.find(l_0_2, "/etc/xdg/systemd/001", 1, true) ~= nil or string.find(l_0_2, "/opt/microsoft/mdatp/conf/scripts", 1, true) or string.find(l_0_3, "grep --color=auto -e ^patch_", 1, true) ~= nil then
  return mp.CLEAN
end
if this_sigattrlog[25].matched and this_sigattrlog[25].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[25].utf8p2:lower()
elseif this_sigattrlog[26].matched and this_sigattrlog[26].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[26].utf8p2:lower()
elseif this_sigattrlog[27].matched and this_sigattrlog[27].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[27].utf8p2:lower()
elseif this_sigattrlog[28].matched and this_sigattrlog[28].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[28].utf8p2:lower()
elseif this_sigattrlog[29].matched and this_sigattrlog[29].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[29].utf8p2:lower()
elseif this_sigattrlog[30].matched and this_sigattrlog[30].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[30].utf8p2:lower()
elseif this_sigattrlog[31].matched and this_sigattrlog[31].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[31].utf8p2:lower()
elseif this_sigattrlog[32].matched and this_sigattrlog[32].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[32].utf8p2:lower()
elseif this_sigattrlog[33].matched and this_sigattrlog[33].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[33].utf8p2:lower()
elseif this_sigattrlog[34].matched and this_sigattrlog[34].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[34].utf8p2:lower()
elseif this_sigattrlog[35].matched and this_sigattrlog[35].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[35].utf8p2:lower()
elseif this_sigattrlog[44].matched and this_sigattrlog[44].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[44].utf8p2:lower()
elseif this_sigattrlog[45].matched and this_sigattrlog[45].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[45].utf8p2:lower()
elseif this_sigattrlog[46].matched and this_sigattrlog[46].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[46].utf8p2:lower()
elseif this_sigattrlog[47].matched and this_sigattrlog[47].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[47].utf8p2:lower()
elseif this_sigattrlog[48].matched and this_sigattrlog[48].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[48].utf8p2:lower()
elseif this_sigattrlog[49].matched and this_sigattrlog[49].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[49].utf8p2:lower()
elseif this_sigattrlog[50].matched and this_sigattrlog[50].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[50].utf8p2:lower()
elseif this_sigattrlog[51].matched and this_sigattrlog[51].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[51].utf8p2:lower()
elseif this_sigattrlog[36].matched and this_sigattrlog[36].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[36].utf8p2:lower()
elseif this_sigattrlog[37].matched and this_sigattrlog[37].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[37].utf8p2:lower()
elseif this_sigattrlog[38].matched and this_sigattrlog[38].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[38].utf8p2:lower()
elseif this_sigattrlog[39].matched and this_sigattrlog[39].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[39].utf8p2:lower()
elseif this_sigattrlog[40].matched and this_sigattrlog[40].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[40].utf8p2:lower()
elseif this_sigattrlog[41].matched and this_sigattrlog[41].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[41].utf8p2:lower()
elseif this_sigattrlog[42].matched and this_sigattrlog[42].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[42].utf8p2:lower()
elseif this_sigattrlog[43].matched and this_sigattrlog[43].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[43].utf8p2:lower()
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_4 = 0
local l_0_5 = {
  "mdatp",
  "firewall",
  "littlesnitch",
  "opensnitch",
  "avast",
  "avira",
  "mcafee",
  "webprotection",
  "isecespd",
  "macmnsvc",
  "masvc",
  "avscan",
  "rtvscand",
  "symcfgd",
  "scmdaemon",
  "symantec",
  "osquery",
  "sophos",
  "elastic-endpoint",
  "falcon",
  "nessusd",
  "cbagentd",
  "td-agent",
  "packetbeat",
  "filebeat",
  "auditbeat",
  "CynetEPS"
}
if string.find(l_0_0, "grep -e", 1, true) ~= nil or string.find(l_0_0, "grep --color=auto -e", 1, true) ~= nil then
  for l_0_6, l_0_7 in pairs(l_0_5) do
    if string.find(l_0_0, l_0_7, 1, true) ~= nil then
      l_0_4 = l_0_4 + 1
    end
  end
  if 2 < l_0_4 then
    TrackPidAndTechniqueBM("BM", "T1518.001", "SecuritySoftwareDiscovery_mt2023")
    local l_0_8, l_0_9 = bm.get_process_relationships()
    for l_0_10, l_0_11 in ipairs(l_0_9) do
      bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_11.ppid)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
