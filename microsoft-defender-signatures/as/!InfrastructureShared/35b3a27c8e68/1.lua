-- Threat: !InfrastructureShared
-- Name: 35b3a27c8e68
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not string.find(l_0_0, "^c:\\") and not string.find(l_0_0, "^\\\\") then
  return mp.CLEAN
end
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "ExecutedPENoCert")
if not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
