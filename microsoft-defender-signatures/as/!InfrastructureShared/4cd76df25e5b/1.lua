-- Threat: !InfrastructureShared
-- Name: 4cd76df25e5b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if l_0_1.find("ffffffff%s+.force") then
    return mp.CLEAN
  end
  if string.match(l_0_1, "conhost%.exe$") or string.match(l_0_1, "conhost%.exe[^a-z0-9A-Z]*$") or string.match(l_0_1, "%d%d%d%d%d+%-%d%d%d%d%d+%-%d%d%d%d%d+%-%d%d%d%d%d") or string.match(l_0_1, " 0xfff") or string.match(l_0_1, "0x4") or string.match(l_0_1, "--headless") then
    return mp.CLEAN
  end
  TrackPidAndTechnique(l_0_0, "T1202", "indirectcmdexec")
  return mp.LOWFI
end
return mp.CLEAN
