-- Threat: !InfrastructureShared
-- Name: 3d5b3edfd3523
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = l_0_0:match("\\([^\\]+)$")
  local l_0_2 = string.sub(l_0_0, 1, string.len(l_0_0) - string.len(l_0_1) - 1)
  if l_0_2:find(":\\windows\\system32", 1, true) or l_0_2:find(":\\windows\\syswow64", 1, true) then
    return mp.CLEAN
  end
  if l_0_2:find(":\\windows\\servicing", 1, true) or l_0_2:find(":\\windows\\winsxs", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
