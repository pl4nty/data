-- Threat: !InfrastructureShared
-- Name: 19b3315b04d4
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 ~= nil then
    local l_0_1 = string.lower(string.sub(mp.ContextualExpandEnvironmentVariables(l_0_0), 2, 11))
    if l_0_1 ~= ":\\windows\\" then
      bm.add_related_file(l_0_0)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
