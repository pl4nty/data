-- Threat: \xac!AMSIPatched.B2
-- Type: 31
-- Includes: LuaFuncHelper

if not IsKeyInRollingQueue("PowershellAMSIpatch", "Amsi", true) then
  return mp.CLEAN
end
local l_0_0 = {
  "AmsiScanBuffer",
  "AmsiScanString"
}
local l_0_1 = mp.GetSMSProcArchitecture()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2
for l_0_3, l_0_4 in ipairs(l_0_0) do
  local l_0_5 = mp.GetProcAddress("amsi.dll", l_0_4)
  if l_0_5 == nil then
    return mp.CLEAN
  end
  local l_0_6 = mp.ReadProcMem(l_0_5, 32)
  l_0_2 = tohex(l_0_6)
  if l_0_6 ~= nil then
    local l_0_7 = mp.x86dasm(l_0_1, l_0_5, l_0_6, 32, 50, l_0_5, mp.DASM_LINEAR_FLOW)
    for l_0_8, l_0_9 in pairs(l_0_7) do
      if (l_0_9.opcode == 195 or l_0_9.opcode == 194) and l_0_8 < 10 then
        pcall(MpCommon.RollingQueueErase, "PowershellAMSIpatch")
        pcall(MpCommon.RollingQueueErase, "PowershellAMSIpatch_Bytes")
        AppendToRollingQueue("PowershellAMSIpatch_Bytes", "Bytes", l_0_2, 86400)
        return mp.INFECTED
      elseif l_0_9.jtype ~= 0 then
        break
      end
    end
  end
end
return mp.CLEAN
