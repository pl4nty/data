local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p1
  end
end
L1_1 = sysio
L1_1 = L1_1.GetFileSize
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = sysio
L2_1 = L2_1.GetLastResult
L2_1 = L2_1()
L2_1 = L2_1.Success
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if 65536 < L1_1 then
  L2_1 = 65536
  L1_1 = L2_1 or L1_1
  if not L2_1 then
  end
end
L2_1 = sysio
L2_1 = L2_1.ReadFile
L3_1 = L0_1
L4_1 = 0
L5_1 = L1_1
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = sysio
L3_1 = L3_1.GetLastResult
L3_1 = L3_1()
L3_1 = L3_1.Success
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = crypto
L3_1 = L3_1.Sha256Buffer
L4_1 = L2_1
L5_1 = 0
L6_1 = L1_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = GetRollingQueueKeyValue
L5_1 = "GPO-ScheduledTasks-LocalPath-Current"
L6_1 = L0_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = {}

function L10_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if not A2_2 and not A3_2 then
    return
  end
  L4_2 = string
  L4_2 = L4_2.format
  L5_2 = "%s %s"
  L6_2 = A2_2 or L6_2
  if not A2_2 then
    L6_2 = ""
  end
  L7_2 = A3_2 or L7_2
  if not A3_2 then
    L7_2 = ""
  end
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = sysio
  L5_2 = L5_2.CommandLineScan
  L6_2 = L4_2
  L7_2 = 0
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = mp
  L6_2 = L6_2.GetExecutablesFromCommandLine
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L7_2 = ipairs
  L8_2 = L6_2
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  for L10_2, L11_2 in L7_2, L8_2, L9_2 do
    L12_2 = sysio
    L12_2 = L12_2.IsFileExists
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if L12_2 then
      L12_2 = bm
      L12_2 = L12_2.add_related_file
      L13_2 = L11_2
      L12_2(L13_2)
    end
  end
  L7_2 = MpCommon
  L7_2 = L7_2.NormalizeString
  L8_2 = L4_2
  L9_2 = "CmdLineNormalizationStandard"
  L7_2 = L7_2(L8_2, L9_2)
  L4_2 = L7_2
  if L4_2 then
    L7_2 = crypto
    L7_2 = L7_2.Sha256Buffer
    L8_2 = L4_2
    L9_2 = 0
    L10_2 = #L4_2
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if L7_2 then
      goto lbl_58
      L4_2 = L7_2 or L4_2
    end
  end
  L4_2 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  ::lbl_58::
  L7_2 = L9_1
  L8_2 = L9_1
  L8_2 = #L8_2
  L8_2 = L8_2 + 1
  L9_2 = {}
  L10_2 = crypto
  L10_2 = L10_2.Sha1Buffer
  L11_2 = A0_2
  L12_2 = 0
  L13_2 = #A0_2
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L9_2.task_uid = L10_2
  L9_2.changed_time = A1_2
  L9_2.cmdline = L4_2
  L10_2 = L5_2 or L10_2
  if not L5_2 then
    L10_2 = false
  end
  L9_2.scan_result = L10_2
  L7_2[L8_2] = L9_2
end

function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  if A2_2 and A1_2 then
    L3_2 = error
    L4_2 = "unexpected text in tag with attributes"
    L3_2(L4_2)
  else
    L3_2 = L4_1
    if not L3_2 then
      if A0_2 == "Task" or A0_2 == "ImmediateTask" then
        L3_2 = 1
        L4_1 = L3_2
        L3_2 = A1_2.uid
        if not L3_2 then
          L3_2 = ""
        end
        L5_1 = L3_2
        L3_2 = A1_2.changed
        if not L3_2 then
          L3_2 = ""
        end
        L6_1 = L3_2
      elseif A0_2 == "TaskV2" or A0_2 == "ImmediateTaskV2" then
        L3_2 = 2
        L4_1 = L3_2
        L3_2 = A1_2.uid
        if not L3_2 then
          L3_2 = ""
        end
        L5_1 = L3_2
        L3_2 = A1_2.changed
        if not L3_2 then
          L3_2 = ""
        end
        L6_1 = L3_2
      end
    else
      L3_2 = L4_1
      if L3_2 == 1 then
        if A0_2 == "Properties" then
          L3_2 = A1_2.appName
          L7_1 = L3_2
          L3_2 = A1_2.args
          L8_1 = L3_2
        end
      else
        L3_2 = L4_1
        if L3_2 == 2 then
          if A0_2 == "Command" then
            L7_1 = A2_2
          elseif A0_2 == "Arguments" then
            L8_1 = A2_2
          end
        end
      end
    end
  end
end

function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L4_1
  if not L1_2 then
    return
  end
  L1_2 = L4_1
  if L1_2 == 1 then
    if A0_2 == "Task" or A0_2 == "ImmediateTask" then
      L1_2 = L10_1
      L2_2 = L5_1
      L3_2 = L6_1
      L4_2 = L7_1
      L5_2 = L8_1
      L1_2(L2_2, L3_2, L4_2, L5_2)
      L1_2 = nil
      L2_2 = nil
      L8_1 = L2_2
      L7_1 = L1_2
      L1_2 = nil
      L4_1 = L1_2
      L1_2 = nil
      L5_1 = L1_2
    end
  else
    L1_2 = L4_1
    if L1_2 == 2 then
      if A0_2 == "Exec" then
        L1_2 = L10_1
        L2_2 = L5_1
        L3_2 = L6_1
        L4_2 = L7_1
        L5_2 = L8_1
        L1_2(L2_2, L3_2, L4_2, L5_2)
        L1_2 = nil
        L2_2 = nil
        L8_1 = L2_2
        L7_1 = L1_2
      elseif A0_2 == "TaskV2" or A0_2 == "ImmediateTaskV2" then
        L1_2 = nil
        L4_1 = L1_2
        L1_2 = nil
        L5_1 = L1_2
      end
    end
  end
end

L13_1 = pcall
L14_1 = parseXML
L15_1 = L2_1
L16_1 = L11_1
L17_1 = L12_1
L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if not L13_1 then
  L15_1 = bm
  L15_1 = L15_1.add_related_string
  L16_1 = "GPO-scheduledtasks-error"
  L17_1 = L14_1
  L18_1 = bm
  L18_1 = L18_1.RelatedStringBMReport
  L15_1(L16_1, L17_1, L18_1)
  L15_1 = mp
  L15_1 = L15_1.INFECTED
  return L15_1
end
L16_1 = L0_1
L15_1 = L0_1.lower
L15_1 = L15_1(L16_1)
L16_1 = L15_1
L15_1 = L15_1.match
L17_1 = "{([0-9a-f\\-]+)}"
L15_1 = L15_1(L16_1, L17_1)
L16_1 = {}
L17_1 = crypto
L17_1 = L17_1.Sha1Buffer
L18_1 = L15_1
L19_1 = 0
L20_1 = #L15_1
L17_1 = L17_1(L18_1, L19_1, L20_1)
L16_1.gpo_guid = L17_1
L16_1.command_lines = L9_1
L17_1 = bm
L17_1 = L17_1.add_related_string
L18_1 = "GPO-scheduledtasks-info"
L19_1 = safeJsonSerialize
L20_1 = L16_1
L19_1 = L19_1(L20_1)
L20_1 = bm
L20_1 = L20_1.RelatedStringBMReport
L17_1(L18_1, L19_1, L20_1)
L17_1 = AppendToRollingQueue
L18_1 = "GPO-ScheduledTasks-LocalPath-Current"
L19_1 = L0_1
L20_1 = L3_1
L21_1 = 604800
L22_1 = 300
L23_1 = 1
L17_1(L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
L17_1 = mp
L17_1 = L17_1.INFECTED
return L17_1
