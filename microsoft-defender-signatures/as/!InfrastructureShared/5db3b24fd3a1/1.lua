-- Threat: !InfrastructureShared
-- Name: 5db3b24fd3a1
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = l_0_0:match("/e:javascript%S?(\"?[^/]*\")")
  if l_0_1 ~= nil then
    l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
    if sysio.IsFileExists(l_0_1) == true then
      bm.add_related_file(l_0_1)
    end
  end
end
return mp.INFECTED
