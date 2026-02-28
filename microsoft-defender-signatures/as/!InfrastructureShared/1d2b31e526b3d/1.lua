local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = mp
    L2_1 = L2_1.ContextualExpandEnvironmentVariables
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p2
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
    L0_1 = L1_1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = mp
      L2_1 = L2_1.ContextualExpandEnvironmentVariables
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p2
      L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L2_1(L3_1)
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
      L0_1 = L1_1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = mp
        L2_1 = L2_1.ContextualExpandEnvironmentVariables
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p2
        L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L2_1(L3_1)
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
        L0_1 = L1_1
      end
    end
  end
end
if L0_1 then
  L1_1 = {}
  L2_1 = "\\users\\.+"
  L3_1 = "\\windows\\.+"
  L4_1 = "\\device\\.+"
  L5_1 = "\\temp\\.+"
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L1_1[3] = L4_1
  L1_1[4] = L5_1
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L0_1
    L9_1 = L6_1
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 then
      L7_1 = bm
      L7_1 = L7_1.get_current_process_startup_info
      L7_1 = L7_1()
      if L7_1 then
        L8_1 = next
        L9_1 = L7_1
        L8_1 = L8_1(L9_1)
        if L8_1 then
          L8_1 = L7_1.command_line
          if L8_1 then
            L8_1 = bm
            L8_1 = L8_1.add_related_file
            L9_1 = L0_1
            L8_1(L9_1)
            L8_1 = bm
            L8_1 = L8_1.request_SMS
            L9_1 = L7_1.ppid
            L10_1 = "M"
            L8_1(L9_1, L10_1)
            L8_1 = bm
            L8_1 = L8_1.add_action
            L9_1 = "SmsAsyncScanEvent"
            L10_1 = 1
            L8_1(L9_1, L10_1)
            L8_1 = mp
            L8_1 = L8_1.INFECTED
            return L8_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
