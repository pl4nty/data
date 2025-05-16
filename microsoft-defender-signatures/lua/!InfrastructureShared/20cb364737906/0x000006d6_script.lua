-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\20cb364737906\0x000006d6_luac 

-- params : ...
-- function num : 0
if IsKeyInRollingQueue("ETWPatch", "FunctionPatched", true) then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[1]).matched then
  l_0_0 = this_sigattrlog[1]
end
if (this_sigattrlog[2]).matched then
  l_0_0 = this_sigattrlog[2]
end
local l_0_1, l_0_2 = (string.match)(l_0_0.utf8p1, "imagename:(.+);targetprocessppid:(%d+):")
if l_0_2 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(mp.GetPPidFromPid, l_0_2)
if l_0_4 == nil or l_0_3 == false then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC54: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC55: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC55: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC55: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC55: Overwrote pending register: R6 in 'AssignReg'

local l_0_6, l_0_7, l_0_8, l_0_9, l_0_10 = "NtTraceEvent", "EtwEventWrite", "EtwEventWriteEx", "EtwEventWriteTransfer", nil
local l_0_11 = (bm.GetPEBInfo)(l_0_4)
if isnull(l_0_11) then
  return mp.CLEAN
end
if l_0_11.ProcArch == mp.SMS_PROC_ARCH_X64 then
  l_0_9 = mp.SMS_PROC_ARCH_X64
else
  if l_0_11.ProcArch == mp.SMS_PROC_ARCH_X32 then
    l_0_9 = mp.SMS_PROC_ARCH_X32
  else
    return mp.CLEAN
  end
end
for l_0_15,l_0_16 in pairs(l_0_5) do
  l_0_6 = (bm.GetProcAddress)(l_0_4, "ntdll.dll", l_0_16)
  if l_0_6 == nil then
    return mp.CLEAN
  end
  l_0_7 = (bm.ReadProcMem)(l_0_6, 256, l_0_4)
  if l_0_7 == nil then
    return mp.CLEAN
  end
  l_0_8 = tohex(l_0_7)
  if l_0_9 == mp.SMS_PROC_ARCH_X64 and l_0_6 < 1.2314530231091e+14 then
    local l_0_17 = (mp.readu_u32)(l_0_7, 1)
    local l_0_18 = (mp.readu_u16)(l_0_7, 5)
    l_0_18 = (mp.bitand)(l_0_18, 255)
    if l_0_17 == 149717832 and l_0_18 == 199 then
      return mp.CLEAN
    end
  end
  do
    l_0_10 = (mp.x86dasm)(l_0_9, l_0_6, l_0_7, 256, 50, l_0_6, mp.DASM_LINEAR_FLOW)
    if l_0_10 == nil then
      return mp.CLEAN
    end
    for l_0_22,l_0_23 in pairs(l_0_10) do
      do
        do
          -- DECOMPILER ERROR at PC184: Unhandled construct in 'MakeBoolean' P1

          if (l_0_23.opcode == 195 or l_0_23.opcode == 194) and l_0_22 < 10 then
            local l_0_24 = (string.format)("Function %s at 0x%02x, cpu is %d", l_0_16, l_0_6, l_0_9)
            ;
            (bm.add_related_string)("ETW PATCH TARGET: ", l_0_1, bm.RelatedStringBMReport)
            ;
            (bm.add_related_string)("ETW PATCH BYTES: ", l_0_8, bm.RelatedStringBMReport)
            ;
            (bm.add_related_string)("ETW NTDLL: ", l_0_24, bm.RelatedStringBMReport)
            TrackPidAndTechnique("BM", "T1562.006", "ETWPatch")
            ;
            (bm.add_related_process)(l_0_4)
            AppendToRollingQueue("ETWPatch", "FunctionPatched", l_0_6, 86400)
            return mp.INFECTED
          end
          do break end
          if l_0_23.jtype ~= 0 then
            break
          end
          -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
    -- DECOMPILER ERROR at PC231: LeaveBlock: unexpected jumping out DO_STMT

  end
end
return mp.CLEAN

