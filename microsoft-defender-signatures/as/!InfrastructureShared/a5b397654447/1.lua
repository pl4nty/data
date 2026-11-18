-- Threat: !InfrastructureShared
-- Name: a5b397654447
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "windows\\explorer.exe", 1, true) or string.find(l_0_0, "\\system32\\svchost.exe", 1, true) or string.find(l_0_0, "\\syswow64\\svchost.exe", 1, true)) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[7].utf8p2
end
if 4 > string.len(l_0_1) and string.lower(l_0_1) ~= "cmd" then
  return mp.CLEAN
end
if string.find(l_0_1, "%1", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if sysio.IsFileExists(l_0_4) then
    bm.add_related_file(l_0_4)
  end
end
local l_0_5 = {}
table.insert(l_0_5, l_0_1)
MpCommon.SetPersistContextNoPath("UACBypassExp.T!regset", l_0_5, 10)
TrackPidAndTechniqueBM("BM", "T1548.002", "uac_bypass_src")
return mp.INFECTED
