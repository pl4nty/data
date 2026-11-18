-- Threat: !InfrastructureShared
-- Name: 55b34a771494
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
local l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[1].utf8p1
  l_0_1 = this_sigattrlog[1].ppid
end
if l_0_2 ~= nil and l_0_0 ~= nil then
  local l_0_3, l_0_4
  l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_2)
  if sysio.IsFileExists(l_0_3) and sysio.IsFileExists(l_0_4) and mp.IsKnownFriendlyFile(l_0_3, true, false) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
    if string.find(l_0_4, "\\system32\\mrt.exe", -17, true) or string.find(l_0_4, "\\asep_inv.exe", -13, true) or string.find(l_0_4, "\\mpsigstub.exe", -14, true) then
      return mp.CLEAN
    end
    bm.add_related_file(l_0_4)
    bm.request_SMS(l_0_1, "l")
    bm.add_action("SingleProcessScan", 100)
    return mp.INFECTED
  end
end
return mp.CLEAN
