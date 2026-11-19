-- Threat: !InfrastructureShared
-- Name: 24eb3d5e0e4e8
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

if is_excluded_parent_proc_auto() or IsSenseRelatedProc() == true or IsProcNameInParentProcessTree("BM", {
  "acrodist.exe",
  "csrss.exe"
}) then
  return mp.CLEAN
end
local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
local l_0_2, l_0_3 = string.match(l_0_0, "^([0-9]+);regionsize:([0-9]+)")
if isnull(l_0_2) or isnull(l_0_3) then
  return mp.CLEAN
end
l_0_2 = tonumber(l_0_2)
l_0_3 = tonumber(l_0_3)
local l_0_4 = bm.get_current_process_startup_info()
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = l_0_4.ppid
local l_0_6 = {
  "AmsiOpenSession",
  "AmsiScanBuffer",
  "AmsiInitialize",
  "AmsiScanString"
}
for l_0_7, l_0_8 in ipairs(l_0_6) do
  local l_0_9 = bm.GetProcAddress(l_0_5, "amsi.dll", l_0_8)
  if isnull(l_0_9) then
    return mp.CLEAN
  end
  if isnull(l_0_9) then
    return mp.CLEAN
  end
  local l_0_10, l_0_11 = bm.VirtualQuery(l_0_9)
  if not l_0_10 or isnull(l_0_11) then
    return mp.CLEAN
  end
  if l_0_11.base_addr == l_0_2 then
    local l_0_12 = bm.get_imagepath()
    if isnull(l_0_12) then
      return mp.CLEAN
    end
    if checkFileLastWriteTime(l_0_12, 300) then
      local l_0_13 = {
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
      local l_0_14 = {
        current_state = l_0_13.INIT,
        patched_process_image_path = l_0_12,
        patched_process_stats = l_0_4,
        patched_process_ppid = l_0_5,
        chosen_amsi_routine_name = l_0_8,
        patched_amsi_routine_addr = l_0_9,
        raw_bytes = nil,
        arch_information = nil,
        disassembled_instructions = nil
      }
      
      local function l_0_15(l_1_0)
        if isnull(l_1_0) then
          return mp.CLEAN
        end
        if isnull(l_1_0.patched_process_image_path) then
          return l_0_13.FINISH
        end
        return l_0_13.CHECK_PATH
      end
      
      local function l_0_16(l_2_0)
        if isnull(l_2_0) then
          return mp.CLEAN
        end
        l_2_0.patched_process_image_path = MpCommon.PathToWin32Path(l_2_0.patched_process_image_path)
        if isnull(l_2_0.patched_process_image_path) then
          return l_0_13.FINISH
        end
        l_2_0.patched_process_image_path = string.lower(l_2_0.patched_process_image_path)
        if isnull(l_2_0.patched_process_image_path) then
          return l_0_13.FINISH
        end
        return l_0_13.GET_PROC_INFO
      end
      
      local function l_0_17(l_3_0)
        if isnull(l_3_0) then
          return mp.CLEAN
        end
        if isnull(l_3_0.patched_process_stats) then
          return l_0_13.FINISH
        end
        local l_3_1 = l_3_0.patched_process_stats.command_line
        if isnull(l_3_0.patched_process_ppid) or isnull(l_3_1) then
          return l_0_13.FINISH
        end
        l_3_0.patched_process_command_line = l_3_1
        return l_0_13.GET_ROUTINE_ADDR
      end
      
      local function l_0_18(l_4_0)
        if isnull(l_4_0) then
          return mp.CLEAN
        end
        if isnull(l_4_0.patched_amsi_routine_addr) then
          return l_0_13.FINISH
        end
        return l_0_13.READ_MEM
      end
      
      local function l_0_19(l_5_0)
        if isnull(l_5_0) then
          return mp.CLEAN
        end
        local l_5_1 = bm.ReadProcMem(l_5_0.patched_amsi_routine_addr, 256, l_5_0.patched_process_ppid)
        if isnull(l_5_1) then
          return l_0_13.FINISH
        end
        l_0_1 = tohex(tostring(l_5_1))
        l_5_0.raw_bytes = l_5_1
        return l_0_13.DETECT_ARCH
      end
      
      local function l_0_20(l_6_0)
        if isnull(l_6_0) then
          return mp.CLEAN
        end
        if l_6_0.patched_amsi_routine_addr > 4294967295 then
          l_6_0.arch_information = mp.SMS_PROC_ARCH_X64
        else
          l_6_0.arch_information = mp.SMS_PROC_ARCH_X32
        end
        return l_0_13.DISASSEMBLE
      end
      
      local function l_0_21(l_7_0)
        if isnull(l_7_0) then
          return mp.CLEAN
        end
        local l_7_1 = mp.x86dasm(l_7_0.arch_information, l_7_0.patched_amsi_routine_addr, l_7_0.raw_bytes, 256, 50, l_7_0.patched_amsi_routine_addr, mp.DASM_LINEAR_FLOW)
        if isnull(l_7_1) then
          return l_0_13.FINISH
        end
        l_7_0.disassembled_instructions = l_7_1
        return l_0_13.ANALYZE
      end
      
      local function l_0_22(l_8_0)
        if isnull(l_8_0) then
          return mp.CLEAN
        end
        for l_8_1, l_8_2 in pairs(l_8_0.disassembled_instructions) do
          if l_8_2.opcode == 235 or l_8_2.opcode == 195 or l_8_2.opcode == 194 then
            local l_8_3 = string.format("[->] Function %s at 0x%02x, cpu is %d", l_8_0.chosen_amsi_routine_name, l_8_0.patched_amsi_routine_addr, l_8_0.arch_information)
            bm.add_related_string("[->] MEDICATED PROCESS: ", l_8_0.patched_process_image_path, bm.RelatedStringBMReport)
            bm.add_related_string("[->] MEDICATED COMMAND LINE: ", l_8_0.patched_process_command_line, bm.RelatedStringBMReport)
            bm.add_related_string("[->] MEDICATED DETAILS", l_8_3, bm.RelatedStringBMReport)
            bm.add_related_string("[->] MEDICATED BYTES", l_0_1, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
        end
        return l_0_13.FINISH
      end
      
      local function l_0_23(l_9_0)
        return mp.CLEAN
      end
      
      local l_0_24 = {
        [l_0_13.INIT] = l_0_15,
        [l_0_13.CHECK_PATH] = l_0_16,
        [l_0_13.GET_PROC_INFO] = l_0_17,
        [l_0_13.GET_ROUTINE_ADDR] = l_0_18,
        [l_0_13.READ_MEM] = l_0_19,
        [l_0_13.DETECT_ARCH] = l_0_20,
        [l_0_13.DISASSEMBLE] = l_0_21,
        [l_0_13.ANALYZE] = l_0_22,
        [l_0_13.FINISH] = l_0_23
      }
      while true do
        local l_0_25 = l_0_24[l_0_14.current_state]
        if not l_0_25 then
          return mp.CLEAN
        end
        local l_0_26 = l_0_25(l_0_14)
        if l_0_26 == mp.INFECTED then
          return mp.INFECTED
        elseif l_0_26 == mp.CLEAN then
          break
        elseif type(l_0_26) ~= "number" then
          return mp.CLEAN
        end
        l_0_14.current_state = l_0_26
        if l_0_14.current_state == l_0_13.FINISH then
          break
        end
      end
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
