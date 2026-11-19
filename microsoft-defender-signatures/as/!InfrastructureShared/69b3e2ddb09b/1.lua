-- Threat: !InfrastructureShared
-- Name: 69b3e2ddb09b
-- Type: 21

local l_0_0 = this_sigattrlog[5].wp1
for l_0_1 = mp.SIGATTR_LOG_SZ, 1, -1 do
  if (sigattr_tail[l_0_1].attribute == 16384 or sigattr_tail[l_0_1].attribute == 16385) and sigattr_tail[l_0_1].wp1 == l_0_0 then
    bm.add_related_file(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
