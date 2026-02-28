local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L1_1["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
L1_1["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
L1_1["4ec5f50d-2073-4ecf-986c-0dcca43f933a"] = true
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L2_1 = L1_1[L2_1]
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end

function L2_1(A0_2)
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

L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p2
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L2_1
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.ContextualExpandEnvironmentVariables
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L6_1 = mp
  L6_1 = L6_1.IsKnownFriendlyFile
  L7_1 = L5_1
  L8_1 = true
  L9_1 = false
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  if not L6_1 then
    L6_1 = bm
    L6_1 = L6_1.get_current_process_startup_info
    L6_1 = L6_1()
    if L6_1 then
      L7_1 = next
      L8_1 = L6_1
      L7_1 = L7_1(L8_1)
      if L7_1 then
        L7_1 = L6_1.command_line
        if L7_1 then
          L7_1 = string
          L7_1 = L7_1.lower
          L8_1 = L6_1.command_line
          L7_1 = L7_1(L8_1)
          L8_1 = bm_AddRelatedFileFromCommandLine
          L9_1 = L7_1
          L10_1 = nil
          L11_1 = nil
          L12_1 = 1
          L8_1(L9_1, L10_1, L11_1, L12_1)
          L8_1 = bm
          L8_1 = L8_1.request_SMS
          L9_1 = L6_1.ppid
          L10_1 = "h+"
          L8_1(L9_1, L10_1)
          L8_1 = bm
          L8_1 = L8_1.add_action
          L9_1 = "SmsAsyncScanEvent"
          L10_1 = 1
          L8_1(L9_1, L10_1)
          L8_1 = bm
          L8_1 = L8_1.add_related_string
          L9_1 = "[->] MEDICATED CMD: "
          L10_1 = L7_1
          L11_1 = bm
          L11_1 = L11_1.RelatedStringBMReport
          L8_1(L9_1, L10_1, L11_1)
          L8_1 = bm
          L8_1 = L8_1.add_related_file
          L9_1 = L7_1
          L8_1(L9_1)
        end
      end
    end
    L7_1 = triggerMemoryScanOnProcessTree
    L8_1 = true
    L9_1 = false
    L10_1 = "SMS_H"
    L11_1 = 5000
    L12_1 = "Behavior:Win32/SuspDllExec.AL!sms"
    L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
    L7_1 = add_parents
    L7_1()
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
