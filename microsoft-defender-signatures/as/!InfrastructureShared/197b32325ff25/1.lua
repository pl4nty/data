-- Threat: !InfrastructureShared
-- Name: 197b32325ff25
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_1 = this_sigattrlog[1].ppid
end
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) and string.find(string.lower(l_0_4), "javaw.exe") == nil then
      bm.add_threat_file(l_0_4)
    end
  end
end
if l_0_1 ~= nil then
  bm.add_threat_process(l_0_1)
end
return mp.INFECTED
