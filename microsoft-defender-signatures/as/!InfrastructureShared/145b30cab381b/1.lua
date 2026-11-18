-- Threat: !InfrastructureShared
-- Name: 145b30cab381b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
local l_0_1 = l_0_0:match("\\([^\\]+)$")
local l_0_2 = {
  ["etrasvc.exe"] = true
}
if l_0_2[l_0_1] then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(bm.get_current_process_startup_info)
if l_0_3 then
  bm_AddRelatedFileFromCommandLine(l_0_4.command_line, nil, nil, 1)
end
local l_0_5, l_0_6
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_5 = this_sigattrlog[2].utf8p2
  l_0_6 = this_sigattrlog[2].utf8p1 or ""
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_5 = this_sigattrlog[3].utf8p2
  l_0_6 = this_sigattrlog[3].utf8p1 or ""
end
if l_0_5 ~= nil and l_0_5 ~= "" then
  local l_0_7 = string.lower(l_0_5)
  local l_0_8 = string.lower(l_0_6)
  if l_0_7:find("amlsaap", 1, true) or l_0_8:find("amlsaap", 1, true) then
    return mp.CLEAN
  end
  if l_0_7:find("wsauth$") then
    return mp.CLEAN
  end
  if l_0_7:find("tspkg$") then
    return mp.CLEAN
  end
  local l_0_9 = mp.GetExecutablesFromCommandLine(l_0_5)
  for l_0_10, l_0_11 in ipairs(l_0_9) do
    l_0_11 = mp.ContextualExpandEnvironmentVariables(l_0_11)
    if sysio.IsFileExists(l_0_11) then
      bm.add_threat_file(l_0_11)
    end
  end
  TrackPidAndTechniqueBM(l_0_4.ppid, "T1547.005", "ssp_tamper")
  return mp.INFECTED
end
return mp.CLEAN
