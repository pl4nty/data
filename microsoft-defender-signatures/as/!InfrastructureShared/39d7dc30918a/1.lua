-- Threat: !InfrastructureShared
-- Name: 39d7dc30918a
-- Type: 21

local l_0_0 = MpCommon.GetPersistContextNoPath("dllhijack_winbio_A")
if l_0_0 and next(l_0_0) ~= nil and l_0_0[2] ~= nil and sysio.IsFileExists(l_0_0[2]) then
  return mp.INFECTED
end
return mp.CLEAN
