-- Threat: !InfrastructureShared
-- Name: 1acb3a4aecdbf
-- Type: 21

local l_0_0 = 3
if bm.GetProcedureMatchDuration(1) > l_0_0 * 10000000 then
  return mp.CLEAN
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  local l_0_1 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[5].utf8p1)
  if l_0_1 ~= nil then
    bm.add_related_file(l_0_1)
  end
end
return mp.INFECTED
