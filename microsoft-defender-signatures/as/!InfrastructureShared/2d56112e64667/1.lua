-- Threat: !InfrastructureShared
-- Name: 2d56112e64667
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
if mp.GetSMSProcArchitecture() ~= mp.SMS_PROC_ARCH_X64 then
  return mp.CLEAN
end
local l_0_0 = mp.GetPEBAddress()
local l_0_1 = mp.ReadProcMem(l_0_0 + 16, 8)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u64(l_0_1, 1)
local l_0_3 = mp.GetSMSMappedFilename(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
if not string.find(l_0_3, "conhost.exe", -11, true) then
  return mp.CLEAN
end
l_0_1 = mp.ReadProcMem(l_0_2, 1024)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_4 = mp.readu_u32(l_0_1, 61)
if 896 < l_0_4 then
  return mp.CLEAN
end
local l_0_5 = mp.readu_u32(l_0_1, 1 + l_0_4)
if l_0_5 ~= 17744 then
  return mp.CLEAN
end
local l_0_6 = l_0_2 + mp.readu_u32(l_0_1, 1 + l_0_4 + 80)
local l_0_7 = mp.hstr_full_log()
for l_0_8, l_0_9 in ipairs(l_0_7) do
  if l_0_9.matched and l_0_9.VA then
    local l_0_10 = l_0_9.VA
    if l_0_2 > l_0_10 or l_0_6 <= l_0_10 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
