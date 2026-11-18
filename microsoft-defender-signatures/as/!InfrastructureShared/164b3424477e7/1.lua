-- Threat: !InfrastructureShared
-- Name: 164b3424477e7
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
bm.add_threat_file(l_0_0)
return mp.INFECTED
