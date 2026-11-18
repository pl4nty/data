-- Threat: !InfrastructureShared
-- Name: 32b3c123b57d
-- Type: 21

local l_0_0 = mp.SIGATTR_LOG_SZ
for l_0_1 = l_0_0, 1, -1 do
  if sigattr_tail[l_0_1].attribute == 16491 and (sigattr_tail[l_0_1].utf8p1 == "GenericRansomware:Type2" or sigattr_tail[l_0_1].utf8p1 == "GenericRansomware:Type4" or sigattr_tail[l_0_1].utf8p1 == "GenericRansomware:Type6") then
    bm.set_detection_string(sigattr_tail[l_0_1].utf8p2)
    return mp.INFECTED
  end
end
return mp.CLEAN
