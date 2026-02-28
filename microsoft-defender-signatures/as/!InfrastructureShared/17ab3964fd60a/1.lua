local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L0_1 = L1_1[1]
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L0_1 = L1_1[2]
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L0_1 = L1_1[3]
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L0_1 = L1_1[4]
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[5]
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[5]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L0_1 = L1_1[5]
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[6]
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[6]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L0_1 = L1_1[6]
          end
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[7]
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[7]
              L1_1 = L1_1.matched
              if L1_1 then
                L1_1 = this_sigattrlog
                L0_1 = L1_1[7]
            end
            else
              L1_1 = this_sigattrlog
              L1_1 = L1_1[8]
              if L1_1 then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[8]
                L1_1 = L1_1.matched
                if L1_1 then
                  L1_1 = this_sigattrlog
                  L0_1 = L1_1[8]
              end
              else
                L1_1 = mp
                L1_1 = L1_1.CLEAN
                return L1_1
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = L0_1.matched
if L2_1 then
  L2_1 = L1_1.ppid
  if L2_1 then
    goto lbl_112
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_112::
L2_1 = MpCommon
L2_1 = L2_1.IsFriendlyProcess
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1.utf8p2
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.format
L4_1 = "%s,address:%s,size:0"
L5_1 = L1_1.ppid
L6_1 = L2_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = mp
L4_1 = L4_1.TriggerScanResource
L5_1 = "ems"
L6_1 = L3_1
L4_1(L5_1, L6_1)
L4_1 = string
L4_1 = L4_1.format
L5_1 = "susp_regions:%s"
L6_1 = L1_1.ppid
L4_1 = L4_1(L5_1, L6_1)
L5_1 = AppendToRollingQueue
L6_1 = L4_1
L7_1 = L2_1
L5_1(L6_1, L7_1)
L5_1 = bm
L5_1 = L5_1.trigger_sig
L6_1 = "ScanSuspiciousRegions"
L7_1 = L3_1
L8_1 = L1_1.ppid
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
