-- Threat: !InfrastructureShared
-- Name: 277b3a53b09cf
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 200000000 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.reason == 2 and l_0_3.cmd_line ~= nil then
    local l_0_4 = string.lower(l_0_3.cmd_line)
    if l_0_4:find("\\lenovo", 1, true) or l_0_4:find("\\eset\\bts.session", 1, true) or l_0_4:find("\\tanium", 1, true) then
      return mp.CLEAN
    end
  end
end
local l_0_5
if this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_5 = string.lower(this_sigattrlog[15].utf8p1)
end
if l_0_5 ~= nil then
  l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
  if sysio.IsFileExists(l_0_5) and not mp.IsKnownFriendlyFile(l_0_5, true, false) then
    bm.add_related_file(l_0_5)
    AddResearchData(this_sigattrlog[15].ppid, true)
    return mp.INFECTED
  end
end
return mp.CLEAN
