local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = ""
L1_1 = ""
L2_1 = ""
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L1_1 = L3_1.utf8p1
  if L1_1 ~= nil then
    L4_1 = L1_1
    L3_1 = L1_1.match
    L5_1 = "(.+[//])"
    L3_1 = L3_1(L4_1, L5_1)
    L0_1 = L3_1
    L2_1 = L1_1
  end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = bm
    L3_1 = L3_1.get_current_process_startup_info
    L3_1 = L3_1()
    L4_1 = L3_1.command_line
    if L4_1 then
      L5_1 = mp
      L5_1 = L5_1.GetExecutablesFromCommandLine
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 == nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = ipairs
      L7_1 = L5_1
      L6_1, L7_1, L8_1 = L6_1(L7_1)
      for L9_1, L10_1 in L6_1, L7_1, L8_1 do
        if L10_1 ~= nil then
          L11_1 = sysio
          L11_1 = L11_1.IsFileExists
          L12_1 = L10_1
          L11_1 = L11_1(L12_1)
          if L11_1 then
            L11_1 = string
            L11_1 = L11_1.sub
            L12_1 = L10_1
            L13_1 = 1
            L14_1 = 5
            L11_1 = L11_1(L12_1, L13_1, L14_1)
            if L11_1 == "/mnt/" then
              L12_1 = L10_1
              L11_1 = L10_1.match
              L13_1 = "(.+[//])"
              L11_1 = L11_1(L12_1, L13_1)
              L0_1 = L11_1
              L2_1 = L10_1
            end
          end
        end
      end
    end
  end
end
if L0_1 == nil or L0_1 == "" or L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = taint
L4_1 = L2_1
L5_1 = "mounted_file_execution"
L6_1 = 3600
L3_1(L4_1, L5_1, L6_1)
L3_1 = "queue_remotedir_mount"
L4_1 = "dir_name"
L5_1 = sysio
L5_1 = L5_1.IsFolderExists
L6_1 = L0_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = GetRollingQueueKeyValues
  L6_1 = L3_1
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L6_1 = ipairs
    L7_1 = L5_1
    L6_1, L7_1, L8_1 = L6_1(L7_1)
    for L9_1, L10_1 in L6_1, L7_1, L8_1 do
      if L10_1 then
        L11_1 = string
        L11_1 = L11_1.sub
        L12_1 = L0_1
        L13_1 = 1
        L14_1 = string
        L14_1 = L14_1.len
        L15_1 = L10_1.value
        L14_1, L15_1 = L14_1(L15_1)
        L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
        L12_1 = L10_1.value
        if L11_1 == L12_1 then
          L11_1 = taint
          L12_1 = L2_1
          L13_1 = "remote_file_created_taint"
          L14_1 = 3600
          L11_1(L12_1, L13_1, L14_1)
          L11_1 = bm
          L11_1 = L11_1.trigger_sig
          L12_1 = "RemoteFileCopy"
          L13_1 = L2_1
          L11_1(L12_1, L13_1)
          L11_1 = this_sigattrlog
          L11_1 = L11_1[1]
          L11_1 = L11_1.matched
          if L11_1 then
            L11_1 = bm
            L11_1 = L11_1.trigger_sig
            L12_1 = "Behavior:Linux/RemoteFileExecution.AL"
            L13_1 = L2_1
            L11_1(L12_1, L13_1)
          else
            L11_1 = this_sigattrlog
            L11_1 = L11_1[2]
            L11_1 = L11_1.matched
            if L11_1 then
              L11_1 = bm
              L11_1 = L11_1.trigger_sig
              L12_1 = "Behavior:Linux/RemoteMountedScriptExecution.AL"
              L13_1 = L2_1
              L11_1(L12_1, L13_1)
            end
          end
          L11_1 = addRelatedProcess
          L11_1()
          L11_1 = reportRelatedBmHits
          L11_1()
          L11_1 = TrackPidAndTechniqueBM
          L12_1 = "BM"
          L13_1 = "T1080"
          L14_1 = "LateralMovement_TaintSharedContent_RemoteMountedFileExecution"
          L11_1(L12_1, L13_1, L14_1)
          L11_1 = mp
          L11_1 = L11_1.INFECTED
          return L11_1
        end
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
