-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1bfb3a6863a9a\1_luac 

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

local l_0_3, l_0_4 = ("AmsiScanBuffer")(("AmsiScanString").GetModAddress, l_0_1, "amsi.dll")
if not l_0_3 or not l_0_4 then
  return mp.CLEAN
end
for l_0_8,l_0_9 in pairs(l_0_2) do
  local l_0_10, l_0_11 = pcall(bm.GetProcAddress, l_0_1, "amsi.dll", l_0_9)
  if l_0_10 then
    if isnull(l_0_11) then
      break
    end
    do
      if l_0_11 <= 4294967295 or not mp.SMS_PROC_ARCH_X64 then
        local l_0_12 = mp.SMS_PROC_ARCH_X32
      end
      local l_0_13, l_0_14 = , pcall(bm.ReadProcMem, l_0_11, 256, l_0_1)
      if l_0_14 and not isnull(R16_PC72) then
        local l_0_15 = nil
        -- DECOMPILER ERROR at PC89: Overwrote pending register: R16 in 'AssignReg'

        R16_PC72 = R16_PC72((mp.x86dasm)(R16_PC72, l_0_11, R18_PC88, #bm.ReadProcMem, 10, l_0_11, mp.DASM_BREAK_ON_JMP + mp.DASM_BREAK_ON_IJMP))
        if not R16_PC72 then
          R16_PC72 = pairs
          R16_PC72 = R16_PC72((mp.x86dasm)(R16_PC72, l_0_11, R18_PC88, #bm.ReadProcMem, 10, l_0_11, mp.DASM_BREAK_ON_JMP + mp.DASM_BREAK_ON_IJMP))
          for l_0_19,l_0_20 in R16_PC72 do
            local l_0_16 = nil
            -- DECOMPILER ERROR at PC98: Confused about usage of register: R20 in 'UnsetPending'

            -- DECOMPILER ERROR at PC101: Confused about usage of register: R20 in 'UnsetPending'

            if (10).opcode == 195 or (10).opcode == 194 then
              (bm.add_related_string)("AMSI: ", (string.format)("func_name=%s,func_addr=0x%02x,cpu=%d,bytes=%s", l_0_9, l_0_11, l_0_13, tohex(l_0_15)), bm.RelatedStringBMReport)
              TrackPidAndTechnique("BM", "T1562.006", "AMSIPatch")
              return mp.INFECTED
            end
          end
        end
      end
      do
        -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC135: Confused about usage of register R9 for local variables in 'ReleaseLocals'


