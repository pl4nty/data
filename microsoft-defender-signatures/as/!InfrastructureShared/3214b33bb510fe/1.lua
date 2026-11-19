-- Threat: !InfrastructureShared
-- Name: 3214b33bb510fe
-- Type: 21

if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_0 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_1 = sigattr_tail[l_0_0]
  if l_0_1.matched and l_0_1.utf8p2 then
    local l_0_2 = string.lower(l_0_1.utf8p2)
    local l_0_3 = false
    local l_0_4 = "\\{[0-9a-f]{8}\\-[0-9a-f]{4}\\-[0-9a-f]{4}\\-[0-9a-f]{4}\\-[0-9a-f]{12}\\}"
    l_0_3, _ = MpCommon.StringRegExpSearch(l_0_4, l_0_2)
    if l_0_3 then
      return mp.CLEAN
    end
  end
  if l_0_1.matched and not l_0_1.utf8p2 then
    return mp.CLEAN
  end
end
return mp.INFECTED
