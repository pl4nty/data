-- Threat: !InfrastructureShared
-- Name: 2db3381f483e
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = l_0_0:match("(.+)\\svchost%.exe")
  l_0_1 = MpCommon.PathToWin32Path(l_0_1)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if l_0_1:match("\\windows\\system32") or l_0_1:match("\\windows\\syswow64") then
    return mp.CLEAN
  end
end
return mp.INFECTED
