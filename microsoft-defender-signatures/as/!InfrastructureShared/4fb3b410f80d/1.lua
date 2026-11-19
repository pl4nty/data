-- Threat: !InfrastructureShared
-- Name: 4fb3b410f80d
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  local l_0_1 = l_0_0:match("totalsizeappend:(%d+);")
  l_0_1 = l_0_1 and tonumber(l_0_1)
  local l_0_2 = l_0_0:match("totalsizewrite:(%d+);")
  l_0_2 = l_0_2 and tonumber(l_0_2)
  if 0 < l_0_2 and 0 < l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
