-- Threat: !InfrastructureShared
-- Name: 69b3e7bffa76
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
  l_0_1 = this_sigattrlog[3].ppid
end
local l_0_2, l_0_3
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[2].utf8p1
  l_0_2 = this_sigattrlog[2].utf8p2
end
if l_0_2 ~= nil and l_0_3 ~= nil and l_0_0 ~= nil then
  local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_2)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
    if sysio.IsFileExists(l_0_6) and l_0_6 == l_0_0 and sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
      bm.request_SMS(l_0_1, "h+")
      bm.add_action("SingleProcessScan", 100)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
