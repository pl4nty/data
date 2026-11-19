-- Threat: !InfrastructureShared
-- Name: 25b3f8039e90
-- Type: 21

local l_0_0 = {}
if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_1 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_2 = sigattr_tail[l_0_1]
  if l_0_2.attribute == 16402 and l_0_2.utf8p2 then
    local l_0_3, l_0_4, l_0_5 = string.match(l_0_2.utf8p2, "DestIp=([%d%.]+);DestPort=(%d+);.+;Uri=(.-);")
    if l_0_3 and l_0_4 then
      local l_0_6 = string.format("ip:%s;port:%s:uri:%s", l_0_3, l_0_4, l_0_5)
      if not l_0_0[l_0_6] then
        l_0_0[l_0_6] = true
        bm.add_related_string("c7de7b1b", l_0_6, bm.RelatedStringBMReport)
      end
    end
  end
end
return mp.INFECTED
