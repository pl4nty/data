-- Threat: !InfrastructureShared
-- Name: 135b305edcec5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].ppid
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[5].utf8p2
end
if l_0_1 == nil or l_0_0 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1:find("csc.exe", 1, true) or l_0_1:find("cvtres.exe", 1, true) or l_0_1:find("wermgr.exe", 1, true) then
  return mp.CLEAN
end
if IsTacticObservedForPid(l_0_0, "webshell_parent") or IsTacticObservedForPid(l_0_0, "webshell_childproc") then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
