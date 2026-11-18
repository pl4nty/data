-- Threat: !InfrastructureShared
-- Name: 71b38107c3a6
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil then
    local l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0)
    if sysio.IsFileExists(l_0_1) then
      bm.add_related_file(l_0_1)
    end
  end
end
return mp.INFECTED
