-- Threat: !InfrastructureShared
-- Name: 8abb3b05a42a0
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.SIGATTR_LOG_SZ
for l_0_1 = l_0_0, 1, -1 do
  if sigattr_tail[l_0_1].attribute == 16491 and sigattr_tail[l_0_1].utf8p1 == "GenericRansomware:Type4" then
    bm.set_detection_string(sigattr_tail[l_0_1].utf8p2)
    addDisruptionInfo(true)
    return mp.INFECTED
  end
end
return mp.CLEAN
