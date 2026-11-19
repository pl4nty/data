-- Threat: !InfrastructureShared
-- Name: 152b3581c6f7a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched and not this_sigattrlog[2].matched and not this_sigattrlog[3].matched then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[4].matched and not isnull(this_sigattrlog[4].utf8p1) then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and not isnull(this_sigattrlog[5].utf8p1) then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if not string.find(l_0_1, "\\sysvol\\", 1, true) or not string.find(l_0_1, "\\policies\\", 1, true) then
  return mp.CLEAN
end
local l_0_3 = string.find(l_0_1, "\\scripts\\logon\\", 1, true) ~= nil
local l_0_5 = string.find(l_0_1, "\\scripts\\startup\\", 1, true) ~= nil
if not l_0_3 and not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = MpCommon.PathToWin32Path(l_0_0)
if isnull(l_0_6) then
  l_0_6 = l_0_0
end
local l_0_7 = sysio.GetFileSize(l_0_6)
if not sysio.GetLastResult().Success then
  return mp.CLEAN
end
if isnull(l_0_7) or l_0_7 <= 0 then
  return mp.CLEAN
end
local l_0_8 = 131072 < l_0_7 and 131072 or l_0_7
local l_0_9 = sysio.ReadFile(l_0_6, 0, l_0_8)
if not sysio.GetLastResult().Success then
  return mp.CLEAN
end
if isnull(l_0_9) then
  return mp.CLEAN
end
local l_0_10 = string.lower(tostring(l_0_9))

local function l_0_11(l_1_0, l_1_1)
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    if string.find(l_1_0, l_1_3, 1, true) then
      return true
    end
  end
  return false
end

local l_0_12 = 0
if l_0_11(l_0_10, {
  "executionpolicy bypass",
  "-ep bypass",
  "-exec bypass",
  "-executionpolicy unrestricted"
}) then
  l_0_12 = l_0_12 + 2
end
if l_0_11(l_0_10, {
  "downloadstring",
  "downloadfile",
  "downloaddata",
  "invoke-webrequest",
  "iwr ",
  "invoke-restmethod",
  "start-bitstransfer",
  "net.webclient",
  "system.net.webclient",
  "curl ",
  "wget ",
  "certutil -urlcache"
}) then
  l_0_12 = l_0_12 + 2
end
if l_0_11(l_0_10, {
  "\\google\\chrome\\application",
  "\\microsoft\\edge\\application",
  "\\bravesoftware\\brave-browser\\application",
  "\\chromium\\application"
}) then
  l_0_12 = l_0_12 + 2
end
if l_0_11(l_0_10, {
  "-encodedcommand",
  "-enc ",
  "frombase64string",
  "::frombase64",
  "invoke-expression",
  "iex(",
  "iex ("
}) then
  l_0_12 = l_0_12 + 1
end
if l_0_11(l_0_10, {
  "writeallbytes",
  "[io.file]::write",
  "-encoding byte",
  "set-content -encoding byte"
}) then
  l_0_12 = l_0_12 + 1
end
if l_0_11(l_0_10, {
  "add-mppreference",
  "set-mppreference",
  "disablerealtimemonitoring"
}) then
  l_0_12 = l_0_12 + 2
end
if l_0_12 < 3 then
  return mp.CLEAN
end
bm.add_related_string("gpo_script_artifact", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("gpo_script_location", l_0_3 and "Logon" or "Startup", bm.RelatedStringBMReport)
local l_0_13 = bm.get_imagepath()
if not isnull(l_0_13) then
  bm.add_related_file(l_0_13)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1484.001", "gpo_logon_script_staging", 28800)
TrackPidAndTechniqueBM("BM", "T1037.001", "gpo_logon_script_staging", 28800)
return mp.INFECTED
