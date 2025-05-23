-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!EtwPatchedB1\Includes\1.luac 

-- params : ...
-- function num : 0
if not IsKeyInRollingQueue("Etwpatch", "Ntdll", true) then
  return mp.CLEAN
end
local l_0_0 = {}
-- DECOMPILER ERROR at PC14: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC15: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC16: Overwrote pending register: R2 in 'AssignReg'

for l_0_4,l_0_5 in ("NtTraceEvent")("EtwEventWrite") do
  local l_0_6 = (mp.GetProcAddress)("ntdll.dll", l_0_5)
  if l_0_6 == nil then
    return mp.CLEAN
  end
  local l_0_7 = (mp.ReadProcMem)(l_0_6, 32)
  if l_0_7 ~= nil then
    local l_0_8 = (mp.readu_u16)(l_0_7, 1)
    local l_0_9 = (mp.bitand)(l_0_8, 255)
    if l_0_9 == 195 then
      pcall(MpCommon.RollingQueueErase, "Etwpatch")
      TrackPidAndTechnique("MemScanLUA", "T1562.006", "ETWPatch")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

