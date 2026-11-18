-- Threat: !InfrastructureShared
-- Name: 42ab3d2384900
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

if (this_sigattrlog[2] == nil or not this_sigattrlog[2].matched) and (this_sigattrlog[3] == nil or not this_sigattrlog[3].matched) and (this_sigattrlog[4] == nil or not this_sigattrlog[4].matched) and not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  "whoami.exe",
  "ipconfig.exe",
  "systeminfo.exe",
  "hostname.exe",
  "nltest.exe",
  "net.exe",
  "net1.exe",
  "quser.exe",
  "query.exe",
  "tasklist.exe",
  "arp.exe",
  "nslookup.exe",
  "dsquery.exe",
  "qwinsta.exe",
  "netstat.exe",
  "route.exe",
  "wmic.exe",
  "cmdkey.exe",
  "klist.exe"
}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = 1
for l_0_6, l_0_7 in ipairs(l_0_1) do
  if l_0_7.image_path ~= nil and l_0_7.ppid ~= nil then
    local l_0_8 = mp.bitand(l_0_7.reason_ex, l_0_5)
    if l_0_8 == l_0_5 then
      local l_0_9 = string.lower(l_0_7.image_path)
      for l_0_10, l_0_11 in ipairs(l_0_2) do
        if string.find(l_0_9, l_0_11, 1, true) then
          l_0_4[l_0_11] = true
          l_0_3[#l_0_3 + 1] = l_0_11 .. "=" .. (l_0_7.cmd_line or "")
          break
        end
      end
      if string.find(l_0_9, "\\cmd.exe", 1, true) and l_0_7.cmd_line then
        local l_0_12 = string.lower(l_0_7.cmd_line)
        if string.find(l_0_12, "whoami", 1, true) then
          l_0_4.cmd_whoami = true
          l_0_3[#l_0_3 + 1] = "cmd_recon=" .. l_0_12
        elseif string.find(l_0_12, "ipconfig", 1, true) then
          l_0_4.cmd_ipconfig = true
          l_0_3[#l_0_3 + 1] = "cmd_recon=" .. l_0_12
        elseif string.find(l_0_12, "net user", 1, true) or string.find(l_0_12, "net group", 1, true) or string.find(l_0_12, "net localgroup", 1, true) then
          l_0_4.cmd_net = true
          l_0_3[#l_0_3 + 1] = "cmd_recon=" .. l_0_12
        elseif string.find(l_0_12, "systeminfo", 1, true) then
          l_0_4.cmd_systeminfo = true
          l_0_3[#l_0_3 + 1] = "cmd_recon=" .. l_0_12
        elseif string.find(l_0_12, "tasklist", 1, true) then
          l_0_4.cmd_tasklist = true
          l_0_3[#l_0_3 + 1] = "cmd_recon=" .. l_0_12
        elseif string.find(l_0_12, "nltest", 1, true) then
          l_0_4.cmd_nltest = true
          l_0_3[#l_0_3 + 1] = "cmd_recon=" .. l_0_12
        end
      end
    end
  end
end
local l_0_13 = 0
for l_0_14 in pairs(l_0_4) do
  l_0_13 = l_0_13 + 1
end
if l_0_13 < 3 then
  return mp.CLEAN
end
local l_0_15 = table.concat(l_0_3, "|")
if 2000 < #l_0_15 then
  l_0_15 = string.sub(l_0_15, 1, 2000)
end
bm.add_related_string("WinRMRecon_count", tostring(l_0_13), bm.RelatedStringBMReport)
bm.add_related_string("WinRMRecon_cmds", l_0_15, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMRecon")
add_parents()
return mp.INFECTED
