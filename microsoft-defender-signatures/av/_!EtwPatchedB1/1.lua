-- Threat: \xac!EtwPatched.B1
-- Type: 31
-- Includes: TechniqueTracker, LuaFuncHelper

if not IsKeyInRollingQueue("Etwpatch", "Ntdll", true) then
  return mp.CLEAN
end
local l_0_0 = {
  "NtTraceEvent",
  "EtwEventWrite",
  "EtwEventWriteEx"
}
for l_0_1, l_0_2 in pairs(l_0_0) do
  local l_0_3 = mp.GetProcAddress("ntdll.dll", l_0_2)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_4 = mp.ReadProcMem(l_0_3, 32)
  if l_0_4 ~= nil then
    local l_0_5 = mp.readu_u16(l_0_4, 1)
    local l_0_6 = mp.bitand(l_0_5, 255)
    if l_0_6 == 195 then
      pcall(MpCommon.RollingQueueErase, "Etwpatch")
      TrackPidAndTechnique("MemScanLUA", "T1562.006", "ETWPatch")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
