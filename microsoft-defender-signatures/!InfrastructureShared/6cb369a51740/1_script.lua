-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb369a51740\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC22: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC23: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("NtTraceEvent")("EtwEventWrite") do
    local l_0_8, l_0_9 = pcall(bm.GetProcAddress, l_0_1, "ntdll.dll", l_0_7)
    if l_0_8 then
      if isnull(l_0_9) then
        break
      end
      do
        if l_0_9 <= 4294967295 or not mp.SMS_PROC_ARCH_X64 then
          local l_0_10 = mp.SMS_PROC_ARCH_X32
        end
        local l_0_11, l_0_12 = , pcall(bm.ReadProcMem, l_0_9, 256, l_0_1)
        if l_0_12 and not isnull(R14_PC61) then
          local l_0_13 = nil
          -- DECOMPILER ERROR at PC69: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC70: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC76: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC77: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC83: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC84: Overwrote pending register: R14 in 'AssignReg'

          if l_0_9 < 1.2314530231091e+14 and (R14_PC61 or R14_PC61) then
            return R14_PC61
          end
          -- DECOMPILER ERROR at PC86: Overwrote pending register: R14 in 'AssignReg'

          -- DECOMPILER ERROR at PC87: Overwrote pending register: R14 in 'AssignReg'

          local l_0_14 = nil
          if not isnull(R14_PC61) then
            for l_0_18,l_0_19 in pairs(R14_PC61) do
              local l_0_15 = R14_PC61
              -- DECOMPILER ERROR at PC109: Confused about usage of register: R19 in 'UnsetPending'

              -- DECOMPILER ERROR at PC112: Confused about usage of register: R19 in 'UnsetPending'

              if (10).opcode == 195 or (10).opcode == 194 then
                (bm.add_related_string)("ETW: ", (string.format)("func_name=%s,func_addr=0x%02x,cpu=%d,bytes=%s", l_0_7, l_0_9, l_0_11, l_0_14), bm.RelatedStringBMReport)
                TrackPidAndTechnique("BM", "T1562.006", "ETWPatch")
                ;
                (bm.request_SMS)(l_0_1, "h+")
                return mp.INFECTED
              end
            end
          end
        end
        do
          -- DECOMPILER ERROR at PC144: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC144: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC144: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC149: Confused about usage of register R7 for local variables in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

