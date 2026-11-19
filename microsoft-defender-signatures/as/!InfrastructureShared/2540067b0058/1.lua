-- Threat: !InfrastructureShared
-- Name: 2540067b0058
-- Type: 21

local l_0_0
if 5 < mp.SIGATTR_LOG_SZ then
  l_0_0 = mp.SIGATTR_LOG_SZ - 5
else
  l_0_0 = 1
end
for l_0_1 = mp.SIGATTR_LOG_SZ, l_0_0, -1 do
  if sigattr_tail[l_0_1].attribute ~= 12305 and sigattr_tail[l_0_1].attribute ~= 12362 then
    if sigattr_tail[l_0_1].attribute == 12421 then
      return mp.INFECTED
    else
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
