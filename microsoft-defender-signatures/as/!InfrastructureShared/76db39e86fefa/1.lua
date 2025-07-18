-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\76db39e86fefa\1.luac 

-- params : ...
-- function num : 0
if not is_excluded_parent_proc_auto() and IsSenseRelatedProc() ~= true then
  local l_0_0 = IsProcNameInParentProcessTree
  local l_0_1 = "BM"
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC13: No list found for R2 , SetList fails

end
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC18: Overwrote pending register: R0 in 'AssignReg'

if l_0_0 then
  return l_0_0
end
-- DECOMPILER ERROR at PC20: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC21: Overwrote pending register: R0 in 'AssignReg'

local l_0_3 = "acrodist.exe"
-- DECOMPILER ERROR at PC30: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC35: Overwrote pending register: R2 in 'AssignReg'

if l_0_0 and l_0_1 and l_0_1 then
  local l_0_4 = "csrss.exe"
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R2 in 'AssignReg'

  l_0_3 = MpCommon
  l_0_3 = l_0_3.SECURITY_MANDATORY_MEDIUM_RID
  -- DECOMPILER ERROR at PC42: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC43: Overwrote pending register: R2 in 'AssignReg'

  if l_0_2 < l_0_3 then
    l_0_3 = l_0_0.ppid
    l_0_2 = l_0_2(l_0_3)
    local l_0_5 = nil
    if l_0_2 then
      l_0_3 = next
      l_0_4 = l_0_2
      l_0_3 = l_0_3(l_0_4)
      if l_0_3 then
        l_0_3 = l_0_2.IntegrityLevel
        if l_0_3 then
          l_0_3 = l_0_2.IntegrityLevel
          l_0_4 = MpCommon
          l_0_4 = l_0_4.SECURITY_MANDATORY_MEDIUM_RID
          if l_0_3 < l_0_4 then
            l_0_3 = bm_AddRelatedFileFromCommandLine
            l_0_4 = l_0_1
            l_0_3(l_0_4, l_0_5, nil, 1)
            l_0_3 = bm
            l_0_3 = l_0_3.request_SMS
            l_0_4 = l_0_0.ppid
            -- DECOMPILER ERROR at PC69: Overwrote pending register: R5 in 'AssignReg'

            l_0_3(l_0_4, l_0_5)
            l_0_3 = bm
            l_0_3 = l_0_3.add_action
            l_0_4 = "SmsAsyncScanEvent"
            -- DECOMPILER ERROR at PC74: Overwrote pending register: R5 in 'AssignReg'

            l_0_3(l_0_4, l_0_5)
            l_0_3 = bm
            l_0_3 = l_0_3.add_related_string
            l_0_4 = "[->] MEDICATED COMMAND LINE: "
            -- DECOMPILER ERROR at PC79: Overwrote pending register: R5 in 'AssignReg'

            l_0_3(l_0_4, l_0_5, bm.RelatedStringBMReport)
            l_0_3 = bm
            l_0_3 = l_0_3.add_related_file
            l_0_4 = l_0_1
            l_0_3(l_0_4)
            l_0_3 = pcallEx
            l_0_4 = "triggerMemoryScanOnProcessTree"
            -- DECOMPILER ERROR at PC89: Overwrote pending register: R5 in 'AssignReg'

            l_0_3(l_0_4, l_0_5, false, true, "SMS_H", 5000, "Behavior:Win32/AMSI.HardwareBreakPoint.L!sms")
            l_0_3 = mp
            l_0_3 = l_0_3.INFECTED
            return l_0_3
          end
        end
      end
    end
  end
end
do
  -- DECOMPILER ERROR at PC99: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: Overwrote pending register: R1 in 'AssignReg'

  return l_0_1
end

