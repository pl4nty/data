local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 1) then
    goto lbl_15
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
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
  L3_1 = "\\mpsigstub.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\mpcmdrun.exe"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "\\threat prevention\\mfetp.exe"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "\\dialer.exe"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "\\nschim.exe"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "\\wininit.exe"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if not L1_1 then
              goto lbl_81
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_81::
L1_1 = TrackCustomPersistContextNameByPPID
L2_1 = "set"
L3_1 = "bm"
L4_1 = "MimikatzTrigger"
L1_1(L2_1, L3_1, L4_1)
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = bm
L2_1 = L2_1.request_SMS
L3_1 = L1_1.ppid
L4_1 = "H"
L2_1(L3_1, L4_1)
L2_1 = bm
L2_1 = L2_1.add_action
L3_1 = "SmsAsyncScanEvent"
L4_1 = 1000
L2_1(L3_1, L4_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
