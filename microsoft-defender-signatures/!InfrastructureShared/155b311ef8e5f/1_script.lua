-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\155b311ef8e5f\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
local l_0_2 = {}
-- DECOMPILER ERROR at PC20: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC21: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC22: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("AmsiScanBuffer")("AmsiScanString") do
  local l_0_8, l_0_9 = pcall(bm.GetProcAddress, l_0_1, "amsi.dll", l_0_7)
  if l_0_8 then
    if isnull(l_0_9) then
      break
    end
    do
      if l_0_9 <= 4294967295 or not mp.SMS_PROC_ARCH_X64 then
        local l_0_10 = mp.SMS_PROC_ARCH_X32
      end
      local l_0_11, l_0_12 = , pcall(bm.ReadProcMem, l_0_9, 256, l_0_1)
      if l_0_12 and not isnull(R14_PC59) then
        local l_0_13 = nil
        -- DECOMPILER ERROR at PC76: Overwrote pending register: R14 in 'AssignReg'

        R14_PC59 = R14_PC59((mp.x86dasm)(R14_PC59, l_0_9, R16_PC75, #bm.ReadProcMem, 10, l_0_9, mp.DASM_BREAK_ON_JMP + mp.DASM_BREAK_ON_IJMP))
        if not R14_PC59 then
          R14_PC59 = pairs
          R14_PC59 = R14_PC59((mp.x86dasm)(R14_PC59, l_0_9, R16_PC75, #bm.ReadProcMem, 10, l_0_9, mp.DASM_BREAK_ON_JMP + mp.DASM_BREAK_ON_IJMP))
          for l_0_17,l_0_18 in R14_PC59 do
            local l_0_14 = nil
            -- DECOMPILER ERROR at PC85: Confused about usage of register: R18 in 'UnsetPending'

            -- DECOMPILER ERROR at PC88: Confused about usage of register: R18 in 'UnsetPending'

            if (10).opcode == 195 or (10).opcode == 194 then
              (bm.add_related_string)("AMSI: ", (string.format)("func_name=%s,func_addr=0x%02x,cpu=%d,bytes=%s", l_0_7, l_0_9, l_0_11, tohex(l_0_13)), bm.RelatedStringBMReport)
              TrackPidAndTechnique("BM", "T1562.006", "AMSIPatch")
              ;
              (bm.request_SMS)(l_0_1, "h+")
              ;
              (bm.trigger_sig)("ReflectiveLoading", "AMSI_Patched")
              return mp.INFECTED
            end
          end
        end
      end
      do
        -- DECOMPILER ERROR at PC127: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC127: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC127: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC132: Confused about usage of register R7 for local variables in 'ReleaseLocals'


