-- Threat: !InfrastructureShared
-- Name: 41b32c8afe05
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = this_sigattrlog[2].utf8p1
  if l_0_0 == nil and string.len(l_0_0) < 3 then
    return mp.CLEAN
  end
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
  local l_0_1 = string.match(l_0_0, "(.-)[^\\]-[^\\%.]+$")
  if l_0_1 == nil and string.len(l_0_1) < 3 then
    return mp.CLEAN
  end
  local l_0_2 = {
    [string.lower(mp.ContextualExpandEnvironmentVariables("%localappdata%\\microsoft\\windows\\"))] = true,
    [string.lower(MpCommon.ExpandEnvironmentVariables("%system%\\"))] = true,
    [string.lower(MpCommon.ExpandEnvironmentVariables("%system%\\config\\systemprofile\\appdata\\local\\microsoftwindows\\"))] = true
  }
  if l_0_2[l_0_1] then
    bm.add_threat_file(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
