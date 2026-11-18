-- Threat: !InfrastructureShared
-- Name: 256b3dc9fe0f6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if not l_0_0 or isnull(l_0_1) or isnull(l_0_1.ppid) then
  return mp.CLEAN
end
local l_0_2 = l_0_1.ppid
local l_0_3 = "AmsiOpenSession"
local l_0_4, l_0_5 = pcall(bm.GetProcAddress, l_0_2, "amsi.dll", l_0_3)
if not l_0_4 or isnull(l_0_5) then
  return mp.CLEAN
end
local l_0_6, l_0_7 = pcall(bm.ReadProcMem, l_0_5, 64000, l_0_2)
if not l_0_6 or isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8 = 4294967295 < l_0_5 and mp.SMS_PROC_ARCH_X64 or mp.SMS_PROC_ARCH_X32
local l_0_9, l_0_10 = pcall(mp.x86dasm, l_0_8, l_0_5, l_0_7, 64000, 100, l_0_5, mp.DASM_LINEAR_FLOW)
if not l_0_9 or isnull(l_0_10) then
  return mp.CLEAN
end
for l_0_11, l_0_12 in pairs(l_0_10) do
  if l_0_12.opcode == 235 then
    if l_0_11 < 15 then
      return mp.INFECTED
    end
    break
  elseif l_0_12.jtype ~= 0 then
    break
  end
end
return mp.CLEAN
