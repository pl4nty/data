-- Threat: !InfrastructureShared
-- Name: ddb39cd8b495
-- Type: 21

if this_sigattrlog[3].matched then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
  if l_0_0 ~= nil then
    local l_0_1, l_0_2
    l_0_1, l_0_2 = string.match(l_0_0, "\\microsoft\\(.+)\\(.+)%.exe")
    if l_0_1 and l_0_2 then
      if l_0_1 == l_0_2 and 3 < string.len(l_0_2) then
        return mp.INFECTED
      end
      mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1), 1966641469)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
