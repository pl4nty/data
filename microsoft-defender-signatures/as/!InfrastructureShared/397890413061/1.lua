-- Threat: !InfrastructureShared
-- Name: 397890413061
-- Type: 21
-- Includes: HstrLuaLib, LuaFuncHelper

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
if mp.GetSMSProcArchitecture() ~= mp.SMS_PROC_ARCH_X64 then
  return mp.CLEAN
end
local l_0_0 = mp.GetSMSMemRanges()
local l_0_1 = mp.hstr_full_log()
local l_0_2 = 0
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4.matched and isSafeToRead(l_0_0, l_0_4.VA, 8) then
    local l_0_5 = mp.ReadProcMem(l_0_4.VA, 8)
    if mp.readu_u32(l_0_5, 1) == 16 then
      l_0_2 = l_0_4.VA + 1
      break
    end
  end
end
if l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_6, l_0_7 = pcallEx("maceExtract_CobaltStrike", maceExtract_CobaltStrike, l_0_2)
if not l_0_6 or #l_0_7 < 3000 then
  return mp.CLEAN
end
return mp.INFECTED
