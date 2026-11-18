-- Threat: !InfrastructureShared
-- Name: 34ab3127ea865
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if is_excluded_parent_proc_auto() or IsSenseRelatedProc() == true or IsProcNameInParentProcessTree("BM", {
  "acrodist.exe",
  "csrss.exe"
}) then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p2
end
local l_0_1, l_0_2 = string.match(l_0_0, "^([0-9]+);regionsize:([0-9]+)")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
l_0_1 = tonumber(l_0_1)
l_0_2 = tonumber(l_0_2)
local l_0_3 = bm.get_current_process_startup_info()
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = l_0_3.ppid
local l_0_5 = "EtwEventWrite"
local l_0_6 = bm.GetProcAddress(l_0_4, "ntdll.dll", l_0_5)
if isnull(l_0_6) then
  return mp.CLEAN
end
local l_0_7, l_0_8 = bm.VirtualQuery(l_0_6)
if not l_0_7 or isnull(l_0_8) then
  return mp.CLEAN
end
if l_0_8.base_addr == l_0_1 then
  local l_0_9 = bm.get_imagepath()
  if isnull(l_0_9) then
    return mp.CLEAN
  end
  if checkFileLastWriteTime(l_0_9, 300) then
    local l_0_10 = {
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
    local l_0_11 = l_0_10.INIT
    local l_0_12, l_0_13, l_0_14, l_0_15
    while true do
      if l_0_11 == l_0_10.INIT then
        if isnull(l_0_9) then
          l_0_11 = l_0_10.FINISH
        else
          l_0_11 = l_0_10.CHECK_PATH
        end
      elseif l_0_11 == l_0_10.CHECK_PATH then
        l_0_9 = MpCommon.PathToWin32Path(l_0_9)
        if isnull(l_0_9) then
          l_0_11 = l_0_10.FINISH
        else
          l_0_9 = string.lower(l_0_9)
          if isnull(l_0_9) then
            l_0_11 = l_0_10.FINISH
          else
            l_0_11 = l_0_10.GET_PROC_INFO
          end
        end
      elseif l_0_11 == l_0_10.GET_PROC_INFO then
        if isnull(l_0_3) then
          l_0_11 = l_0_10.FINISH
        else
          l_0_12 = l_0_3.command_line
          if isnull(l_0_4) or isnull(l_0_12) then
            l_0_11 = l_0_10.FINISH
          else
            l_0_11 = l_0_10.GET_ROUTINE_ADDR
          end
        end
      elseif l_0_11 == l_0_10.GET_ROUTINE_ADDR then
        if isnull(l_0_6) then
          l_0_11 = l_0_10.FINISH
        else
          l_0_11 = l_0_10.READ_MEM
        end
      elseif l_0_11 == l_0_10.READ_MEM then
        l_0_13 = bm.ReadProcMem(l_0_6, 64000, l_0_4)
        if isnull(l_0_13) then
          l_0_11 = l_0_10.FINISH
        else
          l_0_11 = l_0_10.DETECT_ARCH
        end
      elseif l_0_11 == l_0_10.DETECT_ARCH then
        if 4294967295 < l_0_6 then
          l_0_14 = mp.SMS_PROC_ARCH_X64
        else
          l_0_14 = mp.SMS_PROC_ARCH_X32
        end
        l_0_11 = l_0_10.DISASSEMBLE
      elseif l_0_11 == l_0_10.DISASSEMBLE then
        l_0_15 = mp.x86dasm(l_0_14, l_0_6, l_0_13, 64000, 100, l_0_6, mp.DASM_LINEAR_FLOW)
        if isnull(l_0_15) then
          l_0_11 = l_0_10.FINISH
        else
          l_0_11 = l_0_10.ANALYZE
        end
      elseif l_0_11 == l_0_10.ANALYZE then
        for l_0_16, l_0_17 in pairs(l_0_15) do
          if l_0_17.opcode == 195 or l_0_17.opcode == 194 then
            local l_0_18 = string.format("[->] Function %s at 0x%02x, cpu is %d", l_0_5, l_0_6, l_0_14)
            bm.add_related_string("[->] MEDICATED PROCESS: ", l_0_9, bm.RelatedStringBMReport)
            bm.add_related_string("[->] MEDICATED COMMAND LINE: ", l_0_12, bm.RelatedStringBMReport)
            bm.add_related_string("[->] MEDICATED DETAILS", l_0_18, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
        end
        l_0_11 = l_0_10.FINISH
      elseif l_0_11 == l_0_10.FINISH then
        return mp.CLEAN
      end
    end
  end
end
return mp.CLEAN
