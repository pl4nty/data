-- Threat: !InfrastructureShared
-- Name: 51783267ceac
-- Type: 21

if not peattributes.isdll or not peattributes.ismsil then
  return mp.CLEAN
end
local l_0_0 = hstrlog[3].VA
local l_0_1 = hstrlog[4].VA
if l_0_0 > l_0_1 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_va(l_0_0, l_0_1 - l_0_0 + 10)
mp.vfo_add_buffer(l_0_2, "[ShellDump]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
