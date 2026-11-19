-- Threat: !InfrastructureShared
-- Name: 84b3a42aeee9
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1)
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  if mp.IsKnownFriendlyFile(l_0_0, true, false) then
    return mp.CLEAN
  end
  if string.find(l_0_0, "\\windows\\system32", 1, true) then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
