-- Threat: !InfrastructureShared
-- Name: 83b31329173a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = l_0_0:match("binpath=(.+)")
  l_0_1 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    local l_0_4 = string.lower(l_0_3:match("\\([^\\]+)$"))
    local l_0_5 = {
      ["pasensorservices.exe"] = true
    }
    local l_0_6 = string.sub(l_0_3, -4)
    if l_0_6 == ".log" or l_0_6 == ".etl" or l_0_6 == ".txt" then
      l_0_2 = true
    elseif not l_0_5[l_0_4] and sysio.IsFileExists(l_0_3) == true then
      bm.add_related_file(l_0_3)
      if mp.IsKnownFriendlyFile(l_0_3, true, false) then
        mp.ReportLowfi(l_0_3, 1394183950)
      else
        mp.ReportLowfi(l_0_3, 3656319915)
        TrackFileAndTechnique(l_0_3, "T1543.003:exec_service_binary", 1000)
      end
    end
  end
  TrackPidAndTechniqueBM("BM", "T1543.003", "persistence")
end
return mp.INFECTED
