-- Threat: !InfrastructureShared
-- Name: fab3b1162fd8
-- Type: 21

local l_0_0 = 3
if bm.GetProcedureMatchDuration(1) > l_0_0 * 10000000 then
  return mp.CLEAN
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  local l_0_1 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1)
  if l_0_1 ~= nil then
    bm.add_related_file(l_0_1)
  end
end
return mp.INFECTED
