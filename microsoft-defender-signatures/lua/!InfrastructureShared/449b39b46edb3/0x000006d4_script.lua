-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\449b39b46edb3\0x000006d4_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
local l_0_3 = l_0_1.ppid
if l_0_3 == nil or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC51: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC52: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC52: Overwrote pending register: R5 in 'AssignReg'

local l_0_5, l_0_6, l_0_7, l_0_8, l_0_9 = "AmsiScanBuffer", "AmsiScanString", nil, nil, nil
for l_0_13,l_0_14 in pairs(l_0_4) do
  l_0_5 = (bm.GetProcAddress)(l_0_3, "amsi.dll", l_0_14)
  if l_0_5 == nil then
    return mp.CLEAN
  end
  l_0_6 = (bm.ReadProcMem)(l_0_5, 256, l_0_3)
  if l_0_6 == nil then
    return mp.CLEAN
  end
  l_0_7 = tohex(l_0_6)
  if l_0_5 > 4294967295 then
    l_0_8 = mp.SMS_PROC_ARCH_X64
  else
    l_0_8 = mp.SMS_PROC_ARCH_X32
  end
  l_0_9 = (mp.x86dasm)(l_0_8, l_0_5, l_0_6, 256, 50, l_0_5, mp.DASM_LINEAR_FLOW)
  if l_0_9 == nil then
    return mp.CLEAN
  end
  for l_0_18,l_0_19 in pairs(l_0_9) do
    do
      do
        -- DECOMPILER ERROR at PC128: Unhandled construct in 'MakeBoolean' P1

        if (l_0_19.opcode == 195 or l_0_19.opcode == 194) and l_0_18 < 10 then
          local l_0_20 = (string.format)("Function %s at 0x%02x, cpu is %d", l_0_14, l_0_5, l_0_8)
          ;
          (bm.add_related_string)("AMSI PATCH TARGET: ", l_0_0, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("AMSI PATCH BYTES: ", l_0_7, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("AMSI PATCH Commandline: ", l_0_2, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("AMSI: ", l_0_20, bm.RelatedStringBMReport)
          TrackPidAndTechnique("BM", "T1562.006", "AMSIPatch")
          ;
          (bm.request_SMS)(l_0_3, "h+")
          ;
          (bm.trigger_sig)("ReflectiveLoading", "AMSI_Patched")
          return mp.INFECTED
        end
        do break end
        if l_0_19.jtype ~= 0 then
          break
        end
        -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
end
return mp.CLEAN

