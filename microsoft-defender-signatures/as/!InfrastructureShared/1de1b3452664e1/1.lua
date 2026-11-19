-- Threat: !InfrastructureShared
-- Name: 1de1b3452664e1
-- Type: 21

if mp.SIGATTR_LOG_SZ == 0 then
  return mp.CLEAN
end
for l_0_0 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_1 = sigattr_tail[l_0_0]
  if l_0_1.matched and not l_0_1.utf8p2 then
    return mp.CLEAN
  end
end
return mp.INFECTED
