-- Threat: !InfrastructureShared
-- Name: c7b340883f3a
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_0))
  local l_0_1 = StringSplit(l_0_0, "\\")
  if #l_0_1 < 7 or checkFileLastWriteTime(l_0_0, 120) then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_amsi")
  return mp.INFECTED
end
return mp.CLEAN
