-- Threat: !InfrastructureShared
-- Name: ebb32e811172
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if not is_excluded_parent_proc_auto()
  and IsSenseRelatedProc() ~= true
  and not IsProcNameInParentProcessTree("BM", { "acrodist.exe", "csrss.exe" }) then
  local r0_0 = nil
  local r0_1
  if this_sigattrlog[2].matched then
    r0_1 = this_sigattrlog[2].utf8p2
  else
    r0_1 = nil
  end
  local r0_2, r0_3 = string.match(r0_1, "^([0-9]+);regionsize:([0-9]+)")
  if not isnull(r0_2) and not isnull(r0_3) then
    local r0_4 = tonumber(r0_2)
    r0_2 = r0_4
    r0_4 = tonumber(r0_3)
    r0_3 = r0_4
    r0_4 = bm.get_current_process_startup_info()
    if isnull(r0_4) then
      return mp.CLEAN
    end
    local r0_5 = r0_4.ppid
    local r0_6 = {
      "NtTraceEvent", "EtwEventWrite", "EtwEventWriteEx", "EtwEventWriteTransfer",
      "EtwEventWriteFull", "EtwpEventWriteFull"
    }
    for r0_7, r0_8 in ipairs(r0_6) do
      local r0_9 = bm.GetProcAddress(r0_5, "ntdll.dll", r0_8)
      if isnull(r0_9) then
        return mp.CLEAN
      end
      if isnull(r0_9) then
        return mp.CLEAN
      end
      local r0_10, r0_11 = bm.VirtualQuery(r0_9)
      if not r0_10 or isnull(r0_11) then
        return mp.CLEAN
      end
      if r0_11.base_addr == r0_2 then
        local r0_12 = bm.get_imagepath()
        if isnull(r0_12) then
          return mp.CLEAN
        end
        if checkFileLastWriteTime(r0_12, 300) then
          local r0_13 = {
            INIT = 1, CHECK_PATH = 2, GET_PROC_INFO = 3, GET_ROUTINE_ADDR = 4, READ_MEM = 5,
            DETECT_ARCH = 6, DISASSEMBLE = 7, ANALYZE = 8, FINISH = 9
          }
          local r0_14 = {
            current_state = r0_13.INIT, patched_process_image_path = r0_12,
            patched_process_stats = r0_4, patched_process_ppid = r0_5,
            chosen_etw_routine_name = r0_8, patched_etw_routine_addr = r0_9, raw_bytes = nil,
            arch_information = nil, disassembled_instructions = nil
          }

          local function r0_15(p1_0)
            if isnull(p1_0) then
              return mp.CLEAN
            end
            if isnull(p1_0.patched_process_image_path) then
              return r0_13.FINISH
            end
            return r0_13.CHECK_PATH
          end

          local function r0_16(p2_0)
            if isnull(p2_0) then
              return mp.CLEAN
            end
            p2_0.patched_process_image_path = MpCommon.PathToWin32Path(p2_0.patched_process_image_path)
            if isnull(p2_0.patched_process_image_path) then
              return r0_13.FINISH
            end
            p2_0.patched_process_image_path = string.lower(p2_0.patched_process_image_path)
            if isnull(p2_0.patched_process_image_path) then
              return r0_13.FINISH
            end
            return r0_13.GET_PROC_INFO
          end

          local function r0_17(p3_0)
            if isnull(p3_0) then
              return mp.CLEAN
            end
            if isnull(p3_0.patched_process_stats) then
              return r0_13.FINISH
            end
            local r3_0 = p3_0.patched_process_stats.command_line
            if not isnull(p3_0.patched_process_ppid) and not isnull(r3_0) then
              p3_0.patched_process_command_line = r3_0
              return r0_13.GET_ROUTINE_ADDR
            end
            return r0_13.FINISH
          end

          local function r0_18(p4_0)
            if isnull(p4_0) then
              return mp.CLEAN
            end
            if isnull(p4_0.patched_etw_routine_addr) then
              return r0_13.FINISH
            end
            return r0_13.READ_MEM
          end

          local function r0_19(p5_0)
            if isnull(p5_0) then
              return mp.CLEAN
            end
            local r5_0 = bm.ReadProcMem(p5_0.patched_etw_routine_addr, 256,
              p5_0.patched_process_ppid)
            if isnull(r5_0) then
              return r0_13.FINISH
            end
            r0_0 = tohex(tostring(r5_0))
            p5_0.raw_bytes = r5_0
            return r0_13.DETECT_ARCH
          end

          local function r0_20(p6_0)
            if isnull(p6_0) then
              return mp.CLEAN
            end
            if p6_0.patched_etw_routine_addr > 4294967295 then
              p6_0.arch_information = mp.SMS_PROC_ARCH_X64
            else
              p6_0.arch_information = mp.SMS_PROC_ARCH_X32
            end
            return r0_13.DISASSEMBLE
          end

          local function r0_21(p7_0)
            if isnull(p7_0) then
              return mp.CLEAN
            end
            local r7_0 = mp.x86dasm(p7_0.arch_information, p7_0.patched_etw_routine_addr,
              p7_0.raw_bytes, 256, 50, p7_0.patched_etw_routine_addr, mp.DASM_LINEAR_FLOW)
            if isnull(r7_0) then
              return r0_13.FINISH
            end
            p7_0.disassembled_instructions = r7_0
            return r0_13.ANALYZE
          end

          local function r0_22(p8_0)
            if isnull(p8_0) then
              return mp.CLEAN
            end
            for r8_0, r8_1 in pairs(p8_0.disassembled_instructions) do
              if r8_1.opcode == 235 or r8_1.opcode == 195 or r8_1.opcode == 194 then
                if not (r8_0 < 8) then
                  break
                end
                local r8_2 = string.format("[->] Function %s at 0x%02x, cpu is %d",
                  p8_0.chosen_etw_routine_name, p8_0.patched_etw_routine_addr, p8_0.arch_information)
                bm.add_related_string("[->] MEDICATED PROCESS: ", p8_0.patched_process_image_path,
                  bm.RelatedStringBMReport)
                bm.add_related_string("[->] MEDICATED COMMAND LINE: ",
                  p8_0.patched_process_command_line, bm.RelatedStringBMReport)
                bm.add_related_string("[->] MEDICATED DETAILS", r8_2, bm.RelatedStringBMReport)
                bm.add_related_string("[->] MEDICATED BYTES", r0_0, bm.RelatedStringBMReport)
                return mp.INFECTED
              end
              if r8_1.jtype ~= 0 then
                break
              end
            end
            return r0_13.FINISH
          end

          local function r0_23(p9_0)
            return mp.CLEAN
          end

          local r0_24 = {}
          r0_24[r0_13.INIT] = r0_15
          r0_24[r0_13.CHECK_PATH] = r0_16
          local r0_25 = r0_13.GET_PROC_INFO
          r0_24[r0_25] = r0_17
          r0_25 = r0_13.GET_ROUTINE_ADDR
          r0_24[r0_25] = r0_18
          r0_25 = r0_13.READ_MEM
          r0_24[r0_25] = r0_19
          r0_25 = r0_13.DETECT_ARCH
          r0_24[r0_25] = r0_20
          r0_25 = r0_13.DISASSEMBLE
          r0_24[r0_25] = r0_21
          r0_25 = r0_13.ANALYZE
          r0_24[r0_25] = r0_22
          r0_25 = r0_13.FINISH
          r0_24[r0_25] = r0_23
          repeat
            local r0_26 = r0_24[r0_14.current_state]
            if not r0_26 then
              return mp.CLEAN
            end
            local r0_27 = r0_26
            r0_27 = r0_27(r0_14)
            if r0_27 == mp.INFECTED then
              return mp.INFECTED
            end
            if r0_27 == mp.CLEAN then
              break
            end
            if type(r0_27) ~= "number" then
              return mp.CLEAN
            end
            r0_14.current_state = r0_27
          until r0_14.current_state == r0_13.FINISH
          return mp.CLEAN
        end
      end
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
