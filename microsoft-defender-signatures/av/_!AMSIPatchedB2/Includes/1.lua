-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!AMSIPatchedB2\Includes\1.luac 

-- params : ...
-- function num : 0
if not IsKeyInRollingQueue("PowershellAMSIpatch", "Amsi", true) then
  return mp.CLEAN
end
local l_0_0 = {}
-- DECOMPILER ERROR at PC13: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC14: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("AmsiScanBuffer").GetSMSProcArchitecture)()
-- DECOMPILER ERROR at PC19: Overwrote pending register: R2 in 'AssignReg'

if l_0_1 == nil then
  return ("AmsiScanString").CLEAN
end
local l_0_2 = nil
for l_0_6,l_0_7 in ipairs(l_0_0) do
  local l_0_8 = (mp.GetProcAddress)("amsi.dll", l_0_7)
  if l_0_8 == nil then
    return mp.CLEAN
  end
  local l_0_9 = (mp.ReadProcMem)(l_0_8, 32)
  l_0_2 = tohex(l_0_9)
  if l_0_9 ~= nil then
    local l_0_10 = (mp.x86dasm)(l_0_1, l_0_8, l_0_9, 32, 50, l_0_8, mp.DASM_LINEAR_FLOW)
    for l_0_14,l_0_15 in pairs(l_0_10) do
      if (l_0_15.opcode == 195 or l_0_15.opcode == 194) and l_0_14 < 10 then
        pcall(MpCommon.RollingQueueErase, "PowershellAMSIpatch")
        pcall(MpCommon.RollingQueueErase, "PowershellAMSIpatch_Bytes")
        AppendToRollingQueue("PowershellAMSIpatch_Bytes", "Bytes", l_0_2, 86400)
        return mp.INFECTED
      else
        if l_0_15.jtype ~= 0 then
          break
        end
      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC102: Confused about usage of register R5 for local variables in 'ReleaseLocals'


