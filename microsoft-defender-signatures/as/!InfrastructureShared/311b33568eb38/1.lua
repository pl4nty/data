local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= "string" then
    L1_2 = nil
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "\"([^\"]-%.[dD][lL][lL])\""
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    return L1_2
  end
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = "([a-zA-Z]:[\\/][^<>:\"|%?%*]-%.[dD][lL][lL])"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    return L2_2
  end
  L4_2 = A0_2
  L3_2 = A0_2.match
  L5_2 = "(\\\\[^<>:\"|%?%*]-%.[dD][lL][lL])"
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    return L3_2
  end
  L5_2 = A0_2
  L4_2 = A0_2.match
  L6_2 = "([%w%._%-%\\/%(%)~]+%.[dD][lL][lL])"
  L4_2 = L4_2(L5_2, L6_2)
  return L4_2
end

L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p2
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
else
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.ContextualExpandEnvironmentVariables
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L4_1 = mp
  L4_1 = L4_1.IsKnownFriendlyFile
  L5_1 = L3_1
  L6_1 = true
  L7_1 = false
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if not L4_1 then
    L4_1 = bm
    L4_1 = L4_1.get_current_process_startup_info
    L4_1 = L4_1()
    if L4_1 then
      L5_1 = next
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 then
        L5_1 = L4_1.command_line
        if L5_1 then
          L5_1 = string
          L5_1 = L5_1.lower
          L6_1 = L4_1.command_line
          L5_1 = L5_1(L6_1)
          L6_1 = bm_AddRelatedFileFromCommandLine
          L7_1 = L5_1
          L8_1 = nil
          L9_1 = nil
          L10_1 = 1
          L6_1(L7_1, L8_1, L9_1, L10_1)
          L6_1 = bm
          L6_1 = L6_1.request_SMS
          L7_1 = L4_1.ppid
          L8_1 = "h+"
          L6_1(L7_1, L8_1)
          L6_1 = bm
          L6_1 = L6_1.add_action
          L7_1 = "SmsAsyncScanEvent"
          L8_1 = 1
          L6_1(L7_1, L8_1)
          L6_1 = bm
          L6_1 = L6_1.add_related_string
          L7_1 = "[->] MEDICATED CMD: "
          L8_1 = L5_1
          L9_1 = bm
          L9_1 = L9_1.RelatedStringBMReport
          L6_1(L7_1, L8_1, L9_1)
          L6_1 = bm
          L6_1 = L6_1.add_related_file
          L7_1 = L5_1
          L6_1(L7_1)
        end
      end
    end
    L5_1 = triggerMemoryScanOnProcessTree
    L6_1 = true
    L7_1 = false
    L8_1 = "SMS_H"
    L9_1 = 5000
    L10_1 = "Behavior:Win32/SusDllExec.MK!sms"
    L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
    L5_1 = add_parents
    L5_1()
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
