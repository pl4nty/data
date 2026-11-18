-- Threat: !InfrastructureShared
-- Name: 119b332cdd777
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1, l_0_2, l_0_3
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  l_0_2 = string.lower(this_sigattrlog[1].utf8p1)
  l_0_1 = string.match(l_0_2, "\\([^\\]+)$")
  l_0_3 = this_sigattrlog[1].ppid
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  l_0_2 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_1 = string.match(l_0_2, "\\([^\\]+)$")
  l_0_3 = this_sigattrlog[2].ppid
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  l_0_2 = string.lower(this_sigattrlog[3].utf8p1)
  l_0_1 = string.match(l_0_2, "\\([^\\]+)$")
  l_0_3 = this_sigattrlog[3].ppid
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
  l_0_2 = string.lower(this_sigattrlog[4].utf8p1)
  l_0_1 = string.match(l_0_2, "\\([^\\]+)$")
  l_0_3 = this_sigattrlog[4].ppid
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
  l_0_2 = string.lower(this_sigattrlog[5].utf8p1)
  l_0_1 = string.match(l_0_2, "\\([^\\]+)$")
  l_0_3 = this_sigattrlog[5].ppid
elseif this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
  l_0_2 = string.lower(this_sigattrlog[6].utf8p1)
  l_0_1 = string.match(l_0_2, "\\([^\\]+)$")
  l_0_3 = this_sigattrlog[6].ppid
else
  return mp.CLEAN
end
if l_0_2 == nil or l_0_1 == nil or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = {}
local l_0_5 = "T1197"
if l_0_0 ~= nil then
  if string.find(l_0_0, ".csv", 1, true) or string.find(l_0_0, ".ora", 1, true) then
    return mp.CLEAN
  end
  local l_0_6
  if string.sub(l_0_0, -1) == "\"" then
    l_0_6 = string.lower(mp.ContextualExpandEnvironmentVariables(string.match(l_0_0, " (\"[^\"]+\")[%s]*$")))
    l_0_6 = string.match(l_0_6, "[^\"].*[^\"]")
  else
    l_0_6 = string.lower(mp.ContextualExpandEnvironmentVariables(string.match(l_0_0, " (%S+)[%s]*$")))
  end
  if l_0_6 == nil then
    return mp.CLEAN
  end
  local l_0_7 = string.match(l_0_6, "\\([^\\]+)$")
  if l_0_7 == nil then
    return mp.CLEAN
  end
  local l_0_8 = 600
  if not MpCommon.QueryPersistContext(l_0_6, "BitsadminTarget") then
    MpCommon.AppendPersistContext(l_0_6, "BitsadminTarget", l_0_8)
  end
  local l_0_9 = "BM_M" .. l_0_5
  table.insert(l_0_4, l_0_9)
  table.insert(l_0_4, l_0_9 .. ":sourcefilename_" .. l_0_1)
  table.insert(l_0_4, l_0_9 .. ":sourceppid_" .. l_0_3)
  table.insert(l_0_4, l_0_9 .. ":bits_target_" .. l_0_7)
  table.insert(l_0_4, l_0_9 .. ":BitsTargetFile")
  local l_0_10 = false
  l_0_10 = TrackFileAndTechnique(l_0_6, l_0_4, 0, "BitsadminTargetForExec")
  if l_0_10 == false then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
