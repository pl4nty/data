-- Threat: !InfrastructureShared
-- Name: 656b37c1ba38e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if is_excluded_parent_proc_auto() or IsSenseRelatedProc() == true or IsProcNameInParentProcessTree("BM", {
  "csrss.exe",
  "aw.protectionagent.powershellexecutor64.exe",
  "vmware.hub.sfdagent.deploycmd.exe",
  "agentexecutor.exe"
}) then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched then
  l_0_0 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched then
  l_0_0 = this_sigattrlog[12].utf8p2
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
local l_0_5 = bm.GetProcAddress(l_0_4, "rpcrt4.dll", "NdrClientCall3")
if isnull(l_0_5) then
  return mp.CLEAN
end
local l_0_6, l_0_7 = bm.VirtualQuery(l_0_5)
if not l_0_6 or isnull(l_0_7) then
  return mp.CLEAN
end
if l_0_7.base_addr == l_0_1 then
  local l_0_8 = bm.get_imagepath()
  if isnull(l_0_8) then
    return mp.CLEAN
  end
  if checkFileLastWriteTime(l_0_8, 300) then
    do
      local l_0_9 = {
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
      local l_0_10 = {
        current_state = l_0_9.INIT,
        process_image_path = nil,
        process_startup_info = nil,
        process_command_line = nil,
        parent_pid = nil,
        target_routines = {
          "NdrClientCall3"
        },
        chosen_routine_name = nil,
        chosen_routine_addr = nil,
        raw_bytes = nil,
        arch_info = nil,
        disassembly = nil
      }
      
      local function l_0_11(l_1_0)
        l_1_0.process_image_path = bm.get_imagepath()
        if isnull(l_1_0.process_image_path) then
          return l_0_9.FINISH
        end
        return l_0_9.CHECK_PATH
      end
      
      local function l_0_12(l_2_0)
        l_2_0.process_image_path = MpCommon.PathToWin32Path(l_2_0.process_image_path)
        if isnull(l_2_0.process_image_path) then
          return l_0_9.FINISH
        end
        l_2_0.process_image_path = string.lower(l_2_0.process_image_path)
        if isnull(l_2_0.process_image_path) then
          return l_0_9.FINISH
        end
        return l_0_9.GET_PROC_INFO
      end
      
      local function l_0_13(l_3_0)
        l_3_0.process_startup_info = bm.get_current_process_startup_info()
        if isnull(l_3_0.process_startup_info) then
          return l_0_9.FINISH
        end
        l_3_0.process_command_line = l_3_0.process_startup_info.command_line
        l_3_0.parent_pid = l_3_0.process_startup_info.ppid
        if isnull(l_3_0.parent_pid) or isnull(l_3_0.process_command_line) then
          return l_0_9.FINISH
        end
        return l_0_9.GET_ROUTINE_ADDR
      end
      
      local function l_0_14(l_4_0)
        for l_4_1, l_4_2 in ipairs(l_4_0.target_routines) do
          local l_4_3 = bm.GetProcAddress(l_4_0.parent_pid, "rpcrt4.dll", l_4_2)
          if not isnull(l_4_3) then
            l_4_0.chosen_routine_name = l_4_2
            l_4_0.chosen_routine_addr = l_4_3
            break
          end
        end
        if isnull(l_4_0.chosen_routine_addr) then
          return l_0_9.FINISH
        end
        return l_0_9.READ_MEM
      end
      
      local function l_0_15(l_5_0)
        l_5_0.raw_bytes = bm.ReadProcMem(l_5_0.chosen_routine_addr, 64000, l_5_0.parent_pid)
        if isnull(l_5_0.raw_bytes) then
          return l_0_9.FINISH
        end
        return l_0_9.DETECT_ARCH
      end
      
      local function l_0_16(l_6_0)
        l_6_0.arch_info = l_6_0.chosen_routine_addr > 4294967295 and mp.SMS_PROC_ARCH_X64 or mp.SMS_PROC_ARCH_X32
        return l_0_9.DISASSEMBLE
      end
      
      local function l_0_17(l_7_0)
        l_7_0.disassembly = mp.x86dasm(l_7_0.arch_info, l_7_0.chosen_routine_addr, l_7_0.raw_bytes, 64000, 100, l_7_0.chosen_routine_addr, mp.DASM_LINEAR_FLOW)
        if isnull(l_7_0.disassembly) then
          return l_0_9.FINISH
        end
        return l_0_9.ANALYZE
      end
      
      local function l_0_18(l_8_0)
        for l_8_1, l_8_2 in pairs(l_8_0.disassembly) do
          if l_8_2.opcode == 235 or l_8_2.opcode == 195 or l_8_2.opcode == 194 then
            local l_8_3 = string.format("[->] Function %s at 0x%X, cpu is %d", l_8_0.chosen_routine_name, l_8_0.chosen_routine_addr, l_8_0.arch_info)
            bm.add_related_string("[->] MEDICATED PROCESS: ", l_8_0.process_image_path, bm.RelatedStringBMReport)
            bm.add_related_string("[->] MEDICATED COMMAND LINE: ", l_8_0.process_command_line, bm.RelatedStringBMReport)
            bm.add_related_string("[->] MEDICATED DETAILS", l_8_3, bm.RelatedStringBMReport)
            bm.add_related_string("[->] MEDICATED BYTES", l_8_2.opcode, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
        end
        return l_0_9.FINISH
      end
      
      local function l_0_19(l_9_0)
        return mp.CLEAN
      end
      
      local l_0_20 = {
        [l_0_9.INIT] = l_0_11,
        [l_0_9.CHECK_PATH] = l_0_12,
        [l_0_9.GET_PROC_INFO] = l_0_13,
        [l_0_9.GET_ROUTINE_ADDR] = l_0_14,
        [l_0_9.READ_MEM] = l_0_15,
        [l_0_9.DETECT_ARCH] = l_0_16,
        [l_0_9.DISASSEMBLE] = l_0_17,
        [l_0_9.ANALYZE] = l_0_18,
        [l_0_9.FINISH] = l_0_19
      }
      while true do
        local l_0_21 = l_0_20[l_0_10.current_state]
        if not l_0_21 then
          return mp.CLEAN
        end
        local l_0_22 = l_0_21(l_0_10)
        if l_0_22 == mp.INFECTED then
          return mp.INFECTED
        elseif l_0_22 == mp.CLEAN then
          return mp.CLEAN
        end
        if type(l_0_22) ~= "number" then
          return mp.CLEAN
        end
        l_0_10.current_state = l_0_22
      end
    end
  end
end
return mp.CLEAN
