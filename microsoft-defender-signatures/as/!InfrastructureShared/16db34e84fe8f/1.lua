-- Threat: !InfrastructureShared
-- Name: 16db34e84fe8f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].wp2 ~= nil then
  l_0_1 = this_sigattrlog[3].ppid
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].wp2 ~= nil then
  l_0_1 = this_sigattrlog[4].ppid
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].wp2 ~= nil then
  l_0_1 = this_sigattrlog[5].ppid
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].wp2 ~= nil then
  l_0_1 = this_sigattrlog[6].ppid
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].wp2 ~= nil then
  l_0_1 = this_sigattrlog[7].ppid
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
elseif this_sigattrlog[8].matched and this_sigattrlog[8].wp2 ~= nil then
  l_0_1 = this_sigattrlog[8].ppid
  l_0_0 = string.lower(this_sigattrlog[8].utf8p2)
elseif this_sigattrlog[9].matched and this_sigattrlog[9].wp2 ~= nil then
  l_0_1 = this_sigattrlog[9].ppid
  l_0_0 = string.lower(this_sigattrlog[9].utf8p2)
elseif this_sigattrlog[10].matched and this_sigattrlog[10].wp2 ~= nil then
  l_0_1 = this_sigattrlog[10].ppid
  l_0_0 = string.lower(this_sigattrlog[10].utf8p2)
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if this_sigattrlog[3].matched and not string.find(l_0_0, " -w ", 1, true) and not string.find(l_0_0, " --wipe ", 1, true) then
  return mp.CLEAN
elseif this_sigattrlog[7].matched and not string.find(l_0_0, " --security-erase-enhanced ", 1, true) and not string.find(l_0_0, " --security-erase ", 1, true) then
  return mp.CLEAN
elseif this_sigattrlog[8].matched and not string.find(l_0_0, " --all ", 1, true) and not string.find(l_0_0, " -a ", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
  if sysio.IsFileExists(l_0_4) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM(l_0_1, "T1561.001", "Impact_DiskWiper")
addRelatedProcess()
local l_0_5, l_0_6 = bm.get_process_relationships()
for l_0_7, l_0_8 in ipairs(l_0_6) do
  bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_8.ppid)
end
return mp.INFECTED
