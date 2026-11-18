-- Threat: !InfrastructureShared
-- Name: 83b3d4b74256
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    local l_0_4 = string.lower(l_0_3:match("\\([^\\]+)$"))
    local l_0_5 = {
      ["pasensorservices.exe"] = true
    }
    if not l_0_5[l_0_4] and sysio.IsFileExists(l_0_3) then
      if mp.IsKnownFriendlyFile(l_0_3, true, false) then
        local l_0_6 = {
          ["mpksldrv.sys"] = true,
          ["ccmsetup.exe"] = true,
          ["svchost.exe"] = true,
          ["mbamswissarmy.sys"] = true,
          ["cyclorama64.sys"] = true
        }
        if not l_0_6[l_0_4] then
          mp.ReportLowfi(l_0_3, 1394183950)
        end
      else
        mp.ReportLowfi(l_0_3, 3656319915)
        TrackFileAndTechnique(l_0_3, "T1543.003:exec_service_binary", 1000)
      end
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
