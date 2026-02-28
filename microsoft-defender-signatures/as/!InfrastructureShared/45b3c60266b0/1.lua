local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\program files"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\netlogon\\"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "\\sysvol\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = " -nologo "
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = " -noprofile "
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = " -noninteractive "
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if not L2_1 then
            L2_1 = string
            L2_1 = L2_1.find
            L3_1 = L1_1
            L4_1 = "mmdactionengine.ps1"
            L5_1 = 1
            L6_1 = true
            L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
            if not L2_1 then
              L2_1 = string
              L2_1 = L2_1.find
              L3_1 = L1_1
              L4_1 = "\\windows\\ccmcache\\"
              L5_1 = 1
              L6_1 = true
              L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
              if not L2_1 then
                L2_1 = string
                L2_1 = L2_1.find
                L3_1 = L1_1
                L4_1 = "\\centrastage\\"
                L5_1 = 1
                L6_1 = true
                L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                if not L2_1 then
                  L2_1 = string
                  L2_1 = L2_1.find
                  L3_1 = L1_1
                  L4_1 = "\\soc automation team\\"
                  L5_1 = 1
                  L6_1 = true
                  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                  if not L2_1 then
                    L2_1 = string
                    L2_1 = L2_1.find
                    L3_1 = L1_1
                    L4_1 = "\\managedmetadata\\"
                    L5_1 = 1
                    L6_1 = true
                    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                    if not L2_1 then
                      L2_1 = string
                      L2_1 = L2_1.find
                      L3_1 = L1_1
                      L4_1 = "\\packages\\plugins\\microsoft.azure.azuredefenderforservers.mde.windows\\"
                      L5_1 = 1
                      L6_1 = true
                      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                      if not L2_1 then
                        L2_1 = string
                        L2_1 = L2_1.find
                        L3_1 = L1_1
                        L4_1 = "\\drv\\tools\\global\\proactiveagent\\scripts"
                        L5_1 = 1
                        L6_1 = true
                        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
                        if not L2_1 then
                          goto lbl_128
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_128::
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "https:..veeam"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = versioning
  L2_1 = L2_1.GetEngineBuild
  L2_1 = L2_1()
  if 16700 <= L2_1 then
    L2_1 = versioning
    L2_1 = L2_1.GetOrgID
    L2_1 = L2_1()
    if L2_1 ~= nil and L2_1 ~= "" then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
      if L2_1 == "17758f83-f720-459f-a3dd-02f409178457" then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      elseif L2_1 == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
        L3_1 = MpCommon
        L3_1 = L3_1.IsSampled
        L4_1 = 100
        L5_1 = false
        L6_1 = true
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 == true then
          L3_1 = mp
          L3_1 = L3_1.CLEAN
          return L3_1
        end
      end
    end
  end
end
L2_1 = GetTaintLevelHR
L2_1 = L2_1()
if L2_1 == nil or L2_1 ~= "Medium" and L2_1 ~= "High" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsDetectionThresholdMet
L4_1 = "BM"
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = IsTacticObservedForPid
  L4_1 = "BM"
  L5_1 = "processinjection_target"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = IsTacticObservedForPid
    L4_1 = "BM"
    L5_1 = "discovery"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      goto lbl_203
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_203::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
