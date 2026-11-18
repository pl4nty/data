-- Threat: !InfrastructureShared
-- Name: 631b3045d9b57
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = {
  INIT = 1,
  CHECK_PATH = 2,
  GET_PROC_INFO = 3,
  GET_ROUTINE_ADDR = 4,
  READ_MEM = 5,
  DETECT_ARCH = 6,
  DISASSEMBLE = 7,
  ANALYZE = 8,
  FINISH = 9
}
local l_0_1 = l_0_0.INIT
local l_0_2, l_0_3, l_0_4, l_0_5
local l_0_6 = {
  "AmsiOpenSession"
}
local l_0_7, l_0_8, l_0_9, l_0_10, l_0_11
while true do
  if l_0_1 == l_0_0.INIT then
    l_0_2 = bm.get_imagepath()
    if isnull(l_0_2) then
      l_0_1 = l_0_0.FINISH
    else
      l_0_1 = l_0_0.CHECK_PATH
    end
  elseif l_0_1 == l_0_0.CHECK_PATH then
    l_0_2 = MpCommon.PathToWin32Path(l_0_2)
    if isnull(l_0_2) then
      l_0_1 = l_0_0.FINISH
    else
      l_0_2 = string.lower(l_0_2)
      if isnull(l_0_2) then
        l_0_1 = l_0_0.FINISH
      else
        l_0_1 = l_0_0.GET_PROC_INFO
      end
    end
  elseif l_0_1 == l_0_0.GET_PROC_INFO then
    l_0_3 = bm.get_current_process_startup_info()
    if isnull(l_0_3) then
      l_0_1 = l_0_0.FINISH
    else
      l_0_4 = l_0_3.command_line
      l_0_5 = l_0_3.ppid
      if isnull(l_0_5) or isnull(l_0_4) then
        l_0_1 = l_0_0.FINISH
      else
        l_0_1 = l_0_0.GET_ROUTINE_ADDR
      end
    end
  elseif l_0_1 == l_0_0.GET_ROUTINE_ADDR then
    l_0_7 = l_0_6[1]
    l_0_8 = bm.GetProcAddress(l_0_5, "amsi.dll", l_0_7)
    if isnull(l_0_8) then
      l_0_1 = l_0_0.FINISH
    else
      l_0_1 = l_0_0.READ_MEM
    end
  elseif l_0_1 == l_0_0.READ_MEM then
    l_0_9 = bm.ReadProcMem(l_0_8, 64000, l_0_5)
    if isnull(l_0_9) then
      l_0_1 = l_0_0.FINISH
    else
      l_0_1 = l_0_0.DETECT_ARCH
    end
  elseif l_0_1 == l_0_0.DETECT_ARCH then
    if 4294967295 < l_0_8 then
      l_0_10 = mp.SMS_PROC_ARCH_X64
    else
      l_0_10 = mp.SMS_PROC_ARCH_X32
    end
    l_0_1 = l_0_0.DISASSEMBLE
  elseif l_0_1 == l_0_0.DISASSEMBLE then
    l_0_11 = mp.x86dasm(l_0_10, l_0_8, l_0_9, 64000, 100, l_0_8, mp.DASM_LINEAR_FLOW)
    if isnull(l_0_11) then
      l_0_1 = l_0_0.FINISH
    else
      l_0_1 = l_0_0.ANALYZE
    end
  elseif l_0_1 == l_0_0.ANALYZE then
    for l_0_12, l_0_13 in pairs(l_0_11) do
      if l_0_13.opcode == 235 then
        local l_0_14 = string.format("[->] Function %s at 0x%02x, cpu is %d", l_0_7, l_0_8, l_0_10)
        bm.add_related_string("[->] MEDICATED PROCESS: ", l_0_2, bm.RelatedStringBMReport)
        bm.add_related_string("[->] MEDICATED COMMAND LINE: ", l_0_4, bm.RelatedStringBMReport)
        bm.add_related_string("[->] MEDICATED DETAILS", l_0_14, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
    l_0_1 = l_0_0.FINISH
  elseif l_0_1 == l_0_0.FINISH then
    return mp.CLEAN
  end
end
return mp.CLEAN
