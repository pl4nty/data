-- Threat: !InfrastructureShared
-- Name: 19b3143df299
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p1)
  local l_0_1 = mp.GetMotwHostUrlForFile(l_0_0)
  if l_0_1 then
    bm.add_related_string("bmurl", l_0_1, bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
return mp.CLEAN
