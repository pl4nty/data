local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
if L2_1 == nil or L2_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = false
L4_1 = string
L4_1 = L4_1.find
L5_1 = L1_1
L6_1 = "/System/Library/Launch"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= 1 then
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
  L4_1 = L4_1(L5_1)
  
  function L5_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
    L1_2 = string
    L1_2 = L1_2.find
    L2_2 = string
    L2_2 = L2_2.lower
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = "com.apple."
    L4_2 = 1
    L5_2 = true
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if L1_2 == 1 then
      L1_2 = MpCommon
      L1_2 = L1_2.BmTriggerSig
      L2_2 = L4_1
      L3_2 = "BM_SuspMacLaunchItemName"
      L4_2 = L1_1
      L5_2 = "/"
      L6_2 = L2_1
      L4_2 = L4_2 .. L5_2 .. L6_2
      L1_2(L2_2, L3_2, L4_2)
    end
  end
  
  suspNameCheck = L5_1
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "/Library/LaunchAgents"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L1_1
    L7_1 = "/Users/"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 == 1 then
      L5_1 = TrackPidAndTechnique
      L6_1 = L4_1
      L7_1 = "T1543.001"
      L8_1 = "Persistence_UserLaunchAgent"
      L5_1(L6_1, L7_1, L8_1)
    else
      L5_1 = TrackPidAndTechnique
      L6_1 = L4_1
      L7_1 = "T1543.001"
      L8_1 = "Persistence_GlobalLaunchAgent"
      L5_1(L6_1, L7_1, L8_1)
    end
    L5_1 = suspNameCheck
    L6_1 = L2_1
    L5_1(L6_1)
    L3_1 = true
  else
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L1_1
    L7_1 = "/Library/LaunchDaemons"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 == 1 then
      L5_1 = TrackPidAndTechnique
      L6_1 = L4_1
      L7_1 = "T1543.004"
      L8_1 = "Persistence_LaunchDaemon"
      L5_1(L6_1, L7_1, L8_1)
      L5_1 = suspNameCheck
      L6_1 = L2_1
      L5_1(L6_1)
      L3_1 = true
    end
  end
  if L3_1 then
    function L5_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2
      
      if A0_2 == "" or A0_2 == nil then
        L1_2 = true
        return L1_2
      end
      L1_2 = string
      L1_2 = L1_2.find
      L2_2 = A0_2
      L3_2 = "/bin/"
      L4_2 = 1
      L5_2 = true
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if L1_2 ~= 1 then
        L1_2 = string
        L1_2 = L1_2.find
        L2_2 = A0_2
        L3_2 = "/System/"
        L4_2 = 1
        L5_2 = true
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if L1_2 ~= 1 then
          L1_2 = string
          L1_2 = L1_2.find
          L2_2 = A0_2
          L3_2 = "/sbin/"
          L4_2 = 1
          L5_2 = true
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if L1_2 ~= 1 then
            L1_2 = string
            L1_2 = L1_2.find
            L2_2 = A0_2
            L3_2 = "/Library/Apple/"
            L4_2 = 1
            L5_2 = true
            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
            if L1_2 ~= 1 then
              L1_2 = string
              L1_2 = L1_2.find
              L2_2 = A0_2
              L3_2 = "/private/var/db/com.apple.xpc.roleaccountd.staging"
              L4_2 = 1
              L5_2 = true
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if L1_2 ~= 1 then
                L1_2 = string
                L1_2 = L1_2.find
                L2_2 = A0_2
                L3_2 = "/usr/"
                L4_2 = 1
                L5_2 = true
                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                if L1_2 == 1 then
                  L1_2 = string
                  L1_2 = L1_2.find
                  L2_2 = A0_2
                  L3_2 = "/usr/local/"
                  L4_2 = 1
                  L5_2 = true
                  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                  if L1_2 ~= 1 then
                    goto lbl_79
                  end
                end
                L1_2 = string
                L1_2 = L1_2.find
                L2_2 = A0_2
                L3_2 = "/Applications/Microsoft Defender.app/"
                L4_2 = 1
                L5_2 = true
                L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
                if L1_2 ~= 1 then
                  goto lbl_81
                end
              end
            end
          end
        end
      end
      ::lbl_79::
      L1_2 = true
      do return L1_2 end
      ::lbl_81::
      L1_2 = false
      return L1_2
    end
    
    IsProcessExcluded = L5_1
    L5_1 = mp
    L5_1 = L5_1.getfilesize
    L5_1 = L5_1()
    if 10000 < L5_1 then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = mp
    L6_1 = L6_1.readprotection
    L7_1 = false
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.readfile
    L7_1 = 0
    L8_1 = L5_1
    L6_1 = L6_1(L7_1, L8_1)
    L7_1 = mp
    L7_1 = L7_1.readprotection
    L8_1 = true
    L7_1(L8_1)
    if not L6_1 then
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
    
    function L7_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2
      if A0_2 ~= "" and A0_2 ~= nil then
        L1_2 = #A0_2
        if 10 < L1_2 then
          L1_2 = string
          L1_2 = L1_2.find
          L2_2 = A0_2
          L3_2 = "/"
          L4_2 = 1
          L5_2 = true
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if L1_2 == 1 then
            L1_2 = IsProcessExcluded
            L2_2 = A0_2
            L1_2 = L1_2(L2_2)
            if not L1_2 then
              L1_2 = true
              return L1_2
            end
          end
        end
      end
      L1_2 = false
      return L1_2
    end
    
    fileCheckPassed = L7_1
    
    function L7_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
      if A0_2 ~= nil and A0_2 ~= "" then
        L1_2 = string
        L1_2 = L1_2.lower
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        A0_2 = L1_2
        L2_2 = A0_2
        L1_2 = A0_2.match
        L3_2 = "osascript.*with%sadministrator%sprivileges"
        L1_2 = L1_2(L2_2, L3_2)
        if not L1_2 then
          L2_2 = A0_2
          L1_2 = A0_2.match
          L3_2 = "echo.*/bin/bash"
          L1_2 = L1_2(L2_2, L3_2)
          if not L1_2 then
            L2_2 = A0_2
            L1_2 = A0_2.match
            L3_2 = "echo.*/bin/zsh"
            L1_2 = L1_2(L2_2, L3_2)
            if not L1_2 then
              L2_2 = A0_2
              L1_2 = A0_2.match
              L3_2 = "echo.*/bin/sh"
              L1_2 = L1_2(L2_2, L3_2)
              if not L1_2 then
                L2_2 = A0_2
                L1_2 = A0_2.match
                L3_2 = "base64%s%-d"
                L1_2 = L1_2(L2_2, L3_2)
                if not L1_2 then
                  goto lbl_46
                end
              end
            end
          end
        end
        L1_2 = MpCommon
        L1_2 = L1_2.BmTriggerSig
        L2_2 = L4_1
        L3_2 = "BM_SuspMacLaunchItem"
        L4_2 = L1_1
        L5_2 = "/"
        L6_2 = L2_1
        L4_2 = L4_2 .. L5_2 .. L6_2
        L1_2(L2_2, L3_2, L4_2)
        L1_2 = true
        return L1_2
      end
      ::lbl_46::
      L1_2 = false
      return L1_2
    end
    
    SuspPersistence = L7_1
    L7_1 = ""
    L8_1 = {}
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L6_1
    L11_1 = "<key>Program</key>"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 then
      L10_1 = L6_1
      L9_1 = L6_1.match
      L11_1 = "<key>Program</key>%s-<string>(.-)</string>"
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 ~= nil and L9_1 ~= "" then
        L10_1 = fileCheckPassed
        L11_1 = L9_1
        L10_1 = L10_1(L11_1)
        if L10_1 then
          L10_1 = table
          L10_1 = L10_1.insert
          L11_1 = L8_1
          L12_1 = L9_1
          L10_1(L11_1, L12_1)
        end
        L10_1 = L7_1
        L11_1 = " "
        L12_1 = L9_1
        L7_1 = L10_1 .. L11_1 .. L12_1
      end
    end
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L6_1
    L11_1 = "<key>ProgramArguments</key>"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 then
      L10_1 = L6_1
      L9_1 = L6_1.gmatch
      L11_1 = "<key>ProgramArguments</key>%s*<array>(.-)</array>"
      L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
      for L12_1 in L9_1, L10_1, L11_1 do
        L14_1 = L12_1
        L13_1 = L12_1.gmatch
        L15_1 = "<string>(.-)</string>"
        L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1)
        for L16_1 in L13_1, L14_1, L15_1 do
          if L16_1 ~= nil and L16_1 ~= "" then
            L17_1 = fileCheckPassed
            L18_1 = L16_1
            L17_1 = L17_1(L18_1)
            if L17_1 then
              L17_1 = table
              L17_1 = L17_1.insert
              L18_1 = L8_1
              L19_1 = L16_1
              L17_1(L18_1, L19_1)
            end
            L17_1 = L7_1
            L18_1 = " "
            L19_1 = L16_1
            L7_1 = L17_1 .. L18_1 .. L19_1
          end
        end
      end
    end
    L9_1 = SuspPersistence
    L10_1 = L7_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
    
    function L9_1(A0_2)
      local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
      L1_2 = "MAC_UNSIGNED_ADHOC_PATHS"
      L2_2 = "unsigned_adhoc_items"
      L3_2 = GetRollingQueueCount
      L4_2 = L1_2
      L3_2 = L3_2(L4_2)
      if 0 < L3_2 then
        L3_2 = IsKeyValuePairInRollingQueue
        L4_2 = L1_2
        L5_2 = L2_2
        L6_2 = A0_2
        L3_2 = L3_2(L4_2, L5_2, L6_2)
        if L3_2 then
          L3_2 = true
          return L3_2
        end
      end
      L3_2 = false
      return L3_2
    end
    
    checkAdhocUnsigned = L9_1
    if L8_1 then
      L9_1 = #L8_1
      if 0 < L9_1 then
        L9_1 = "MAC_PERSIST_PROG_PATHS"
        L10_1 = pairs
        L11_1 = L8_1
        L10_1, L11_1, L12_1 = L10_1(L11_1)
        for L13_1, L14_1 in L10_1, L11_1, L12_1 do
          L15_1 = sysio
          L15_1 = L15_1.IsFileExists
          L16_1 = L14_1
          L15_1 = L15_1(L16_1)
          if L15_1 then
            L15_1 = 86400
            L16_1 = AppendToRollingQueue
            L17_1 = L9_1
            L18_1 = L2_1
            L19_1 = L14_1
            L20_1 = L15_1
            L21_1 = 50
            L22_1 = 0
            L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
            L16_1 = checkAdhocUnsigned
            L17_1 = L14_1
            L16_1 = L16_1(L17_1)
            if L16_1 then
              L16_1 = mp
              L16_1 = L16_1.ReportLowfi
              L17_1 = L14_1
              L18_1 = 1523570201
              L16_1(L17_1, L18_1)
              L16_1 = mp
              L16_1 = L16_1.INFECTED
              return L16_1
            end
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
