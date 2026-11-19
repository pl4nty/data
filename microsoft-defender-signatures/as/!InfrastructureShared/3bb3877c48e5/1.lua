-- Threat: !InfrastructureShared
-- Name: 3bb3877c48e5
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.match(string.lower(this_sigattrlog[1].utf8p2), "start ([^%s]+)$")
  if l_0_0 then
    local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "NewServiceCreation")
    if l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
