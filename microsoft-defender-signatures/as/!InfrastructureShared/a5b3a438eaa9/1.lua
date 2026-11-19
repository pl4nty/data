-- Threat: !InfrastructureShared
-- Name: a5b3a438eaa9
-- Type: 21

local l_0_0, l_0_1, l_0_2
mp.set_mpattribute("WPADExploitAttempt.seen")
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].timestamp
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].timestamp
end
if this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].timestamp
end
if this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].timestamp
  l_0_2 = this_sigattrlog[5].utf8p1
  local l_0_3 = string.lower(string.sub(this_sigattrlog[5].utf8p1, -12))
  local l_0_4 = string.lower(this_sigattrlog[5].utf8p2)
  if l_0_3 == nil or string.find(l_0_3, "rundll32.exe", 1, true) and (string.find(l_0_4, "davclnt.dll", 1, true) or string.find(l_0_4, "winethc.dll", 1, true)) then
    return mp.CLEAN
  end
end
if l_0_0 <= l_0_1 then
  local l_0_5 = this_sigattrlog[6].utf8p1
  l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
  if sysio.IsFileExists(l_0_5) then
    bm.add_related_file(l_0_5)
    mp.ReportLowfi(l_0_5, 1402450356)
  end
  if this_sigattrlog[5].matched and sysio.IsFileExists(l_0_2) then
    bm.add_related_file(l_0_2)
  end
  return mp.INFECTED
end
return mp.CLEAN
