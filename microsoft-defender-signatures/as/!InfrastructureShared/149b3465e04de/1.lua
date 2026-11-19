-- Threat: !InfrastructureShared
-- Name: 149b3465e04de
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1 = l_0_0:match("\\([^\\]+)$")
local l_0_2 = {
  ["svchost.exe"] = true,
  ["lsass.exe"] = true,
  ["services.exe"] = true,
  ["connectionclient.exe"] = true
}
if l_0_2[l_0_1] then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[4].utf8p2
end
if l_0_3 ~= nil then
  local l_0_4 = string.lower(l_0_3)
  if l_0_4:find("wsauth$", 1, true) then
    return mp.CLEAN
  end
  if l_0_4:find("amlsaap", 1, true) then
    return mp.CLEAN
  end
  if l_0_4:find("tspkg$", 1, true) then
    return mp.CLEAN
  end
  local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_3)
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_7)
    if sysio.IsFileExists(l_0_7) then
      bm.add_related_file(l_0_7)
    end
  end
end
local l_0_8, l_0_9 = pcall(bm.get_current_process_startup_info)
if l_0_8 then
  bm_AddRelatedFileFromCommandLine(l_0_9.command_line, nil, nil, 1)
end
TrackPidAndTechniqueBM(l_0_9.ppid, "T1547.005", "ssp_tamper")
AddTacticForPid(l_0_9.ppid, "tt-thresholdmet")
return mp.INFECTED
