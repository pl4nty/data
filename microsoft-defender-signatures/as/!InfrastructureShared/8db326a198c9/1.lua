-- Threat: !InfrastructureShared
-- Name: 8db326a198c9
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(l_0_0, "SuspCredEnumerateAttempt") then
  MpCommon.AppendPersistContext(l_0_0, "SuspCredEnumerateAttempt", 0)
end
if not MpCommon.QueryPersistContext(l_0_0, "queryAgePrev") then
  MpCommon.AppendPersistContext(l_0_0, "queryAgePrev", 0)
end
return mp.INFECTED
