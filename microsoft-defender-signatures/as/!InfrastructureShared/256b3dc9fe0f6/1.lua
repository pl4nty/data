-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\256b3dc9fe0f6\1.luac 

-- params : ...
-- function num : 0
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
do
  if l_0_5 <= 4294967295 or not mp.SMS_PROC_ARCH_X64 then
    local l_0_8, l_0_9 = mp.SMS_PROC_ARCH_X32
  end
  -- DECOMPILER ERROR at PC66: Confused about usage of register: R8 in 'UnsetPending'

  local l_0_10, l_0_11 = , pcall(mp.x86dasm, l_0_8, l_0_5, l_0_7, 64000, 100, l_0_5, mp.DASM_LINEAR_FLOW)
  if not l_0_11 or isnull(R12_PC79) then
    return mp.CLEAN
  end
  for l_0_15,l_0_16 in pairs(R12_PC79) do
    local l_0_12 = nil
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R15 in 'UnsetPending'

    -- DECOMPILER ERROR at PC96: Unhandled construct in 'MakeBoolean' P1

    if (100).opcode == 235 and l_0_16 < 15 then
      return mp.INFECTED
    end
    do break end
    -- DECOMPILER ERROR at PC99: Confused about usage of register: R15 in 'UnsetPending'

    if (100).jtype ~= 0 then
      break
    end
  end
  do
    return mp.CLEAN
  end
end

