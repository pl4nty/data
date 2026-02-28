local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = string
    L0_1 = L0_1.lower
    L1_1 = bm
    L1_1 = L1_1.get_imagepath
    L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1()
    L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
    if L0_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "\\program files"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "\\sysmon"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "\\sophos"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "\\threatsonar"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "tenable_mw_scan"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if not L1_1 then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "\\cynetms"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if not L1_1 then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "\\xenldr"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if not L1_1 then
                    goto lbl_85
                  end
                end
              end
            end
          end
        end
      end
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    ::lbl_85::
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p1
    L3_1 = "(%d+):"
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = tonumber
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
    L2_1 = mp
    L2_1 = L2_1.GetPPidFromPid
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = MpCommon
    L3_1 = L3_1.GetImagePathFromPid
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L6_1 = L3_1
      L5_1 = L3_1.lower
      L5_1 = L5_1(L6_1)
      L6_1 = "\\windows\\system32\\lsass.exe"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 then
        L4_1 = bm
        L4_1 = L4_1.get_current_process_startup_info
        L4_1 = L4_1()
        L5_1 = bm
        L5_1 = L5_1.request_SMS
        L6_1 = L4_1.ppid
        L7_1 = "H"
        L5_1(L6_1, L7_1)
        L5_1 = TrackCustomPersistContextNameByPPID
        L6_1 = "set"
        L7_1 = L4_1.ppid
        L8_1 = "MimikatzTrigger"
        L5_1(L6_1, L7_1, L8_1)
        L5_1 = bm
        L5_1 = L5_1.add_action
        L6_1 = "SmsAsyncScanEvent"
        L7_1 = 1000
        L5_1(L6_1, L7_1)
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
