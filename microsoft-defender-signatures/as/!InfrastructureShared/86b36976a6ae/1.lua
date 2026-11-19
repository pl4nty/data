-- Threat: !InfrastructureShared
-- Name: 86b36976a6ae
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 then
  local l_0_0 = this_sigattrlog[1].utf8p1:match("([^\\]+)$")
  local l_0_1 = GetRollingQueueKeys("NewlyRegisteredServices_Name")
  if l_0_1 then
    for l_0_2, l_0_3 in ipairs(l_0_1) do
      if contains(l_0_0, l_0_3) then
        bm.add_related_string("RegisteredSrv", l_0_0, bm.RelatedStringBMReport)
        local l_0_4 = reportRelevantUntrustedEntities(0)
        if l_0_4 and next(l_0_4) then
          bm.add_related_string("UntrustedEntities", safeJsonSerialize(l_0_4), bm.RelatedStringBMReport)
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
