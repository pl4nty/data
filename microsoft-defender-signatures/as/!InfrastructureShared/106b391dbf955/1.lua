local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L0_1 = L3_1[2]
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L0_1 = L3_1[3]
  else
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = isnull
L4_1 = L0_1.utf8p1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L0_1.utf8p2
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_33
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_33::
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = isnull
  L5_1 = L3_1.ppid
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_49
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_49::
L4_1 = string
L4_1 = L4_1.match
L5_1 = L0_1.utf8p1
L6_1 = "imagename:(.+);targetprocessppid:(%d+):(%d+)$"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
L7_1 = string
L7_1 = L7_1.match
L8_1 = L0_1.utf8p2
L9_1 = "vmbaseaddress:(.+);[a-z]-regionsize:(%d+);"
L7_1, L8_1 = L7_1(L8_1, L9_1)
L9_1 = isnull
L10_1 = L4_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = isnull
  L10_1 = L5_1
  L9_1 = L9_1(L10_1)
  if not L9_1 then
    L9_1 = isnull
    L10_1 = L6_1
    L9_1 = L9_1(L10_1)
    if not L9_1 then
      L9_1 = isnull
      L10_1 = L7_1
      L9_1 = L9_1(L10_1)
      if not L9_1 then
        L9_1 = isnull
        L10_1 = L8_1
        L9_1 = L9_1(L10_1)
        if not L9_1 then
          goto lbl_87
        end
      end
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_87::
L9_1 = string
L9_1 = L9_1.format
L10_1 = "pid:%d,ProcessStart:%d"
L11_1 = L5_1
L12_1 = L6_1
L9_1 = L9_1(L10_1, L11_1, L12_1)
L10_1 = mp
L10_1 = L10_1.SIGATTR_LOG_SZ
if L10_1 == 0 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = mp
L10_1 = L10_1.SIGATTR_LOG_SZ
L11_1 = 1
L12_1 = -1
for L13_1 = L10_1, L11_1, L12_1 do
  L14_1 = sigattr_tail
  L14_1 = L14_1[L13_1]
  if not L1_1 or not L2_1 then
    L15_1 = isnull
    L16_1 = L14_1.attribute
    L15_1 = L15_1(L16_1)
    if not L15_1 then
      L15_1 = isnull
      L16_1 = L14_1.utf8p1
      L15_1 = L15_1(L16_1)
      if not L15_1 then
        L15_1 = L14_1.attribute
        if L15_1 == 16427 then
          L15_1 = isnull
          L16_1 = L14_1.np2
          L15_1 = L15_1(L16_1)
          if not L15_1 then
            L15_1 = L14_1.np2
            if 2031616 <= L15_1 then
              L15_1 = string
              L15_1 = L15_1.match
              L16_1 = L14_1.utf8p1
              L17_1 = "^..*\\(.+)$"
              L15_1 = L15_1(L16_1, L17_1)
              L16_1 = isnull
              L17_1 = L15_1
              L16_1 = L16_1(L17_1)
              if not L16_1 and L4_1 == L15_1 then
                L1_1 = true
              end
          end
        end
        else
          L15_1 = L14_1.attribute
          if L15_1 == 16497 then
            L15_1 = isnull
            L16_1 = L14_1.utf8p2
            L15_1 = L15_1(L16_1)
            if not L15_1 then
              L15_1 = string
              L15_1 = L15_1.match
              L16_1 = L14_1.utf8p2
              L17_1 = "TargetPPID:(%d+):(%d+);TargetThreadID:(%d+)$"
              L15_1, L16_1, L17_1 = L15_1(L16_1, L17_1)
              L18_1 = isnull
              L19_1 = L15_1
              L18_1 = L18_1(L19_1)
              if not L18_1 then
                L18_1 = isnull
                L19_1 = L16_1
                L18_1 = L18_1(L19_1)
                if not L18_1 then
                  L18_1 = isnull
                  L19_1 = L17_1
                  L18_1 = L18_1(L19_1)
                  if not L18_1 then
                    L18_1 = L14_1.utf8p1
                    if L4_1 == L18_1 and L5_1 == L15_1 and L6_1 == L16_1 then
                      L2_1 = L17_1
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
if not L1_1 or not L2_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = false
L11_1 = bm
L11_1 = L11_1.get_process_relationships
L12_1 = L9_1
L11_1 = L11_1(L12_1)
L12_1 = isnull
L13_1 = L11_1
L12_1 = L12_1(L13_1)
if not L12_1 then
  L12_1 = #L11_1
  if L12_1 ~= 0 then
    goto lbl_207
  end
end
L12_1 = true
L13_1 = {}
L11_1 = L13_1
L10_1 = L12_1
::lbl_207::
L12_1 = pairs
L13_1 = L11_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
for L15_1, L16_1 in L12_1, L13_1, L14_1 do
  L17_1 = L16_1.ppid
  L18_1 = L3_1.ppid
  if L17_1 == L18_1 then
    L10_1 = true
  end
end
if not L10_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.format
L13_1 = "Injected at least %d bytes into %s (PID:%d) at %s"
L14_1 = L8_1
L15_1 = L4_1
L16_1 = L5_1
L17_1 = tostring
L18_1 = L7_1
L17_1, L18_1, L19_1 = L17_1(L18_1)
L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
L13_1 = bm
L13_1 = L13_1.add_related_string
L14_1 = "ProcessHollowSummary"
L15_1 = L12_1
L16_1 = bm
L16_1 = L16_1.RelatedStringBMReport
L13_1(L14_1, L15_1, L16_1)
L13_1 = TrackPidAndTechniqueBM
L14_1 = L3_1.ppid
L15_1 = "T1055.012"
L16_1 = "processhollow"
L13_1(L14_1, L15_1, L16_1)
L13_1 = TrackPidAndTechniqueBM
L14_1 = L9_1
L15_1 = "T1055.012"
L16_1 = "processhollow_target"
L13_1(L14_1, L15_1, L16_1)
L13_1 = bm
L13_1 = L13_1.trigger_sig_target_propagate
L14_1 = "CodeInjectTargeting"
L15_1 = string
L15_1 = L15_1.format
L16_1 = "Process Hollow by %s"
L17_1 = L3_1.ppid
L15_1 = L15_1(L16_1, L17_1)
L16_1 = L9_1
L13_1(L14_1, L15_1, L16_1)
L13_1 = bm
L13_1 = L13_1.add_related_process
L14_1 = L9_1
L13_1(L14_1)
L13_1 = AddSuspiciousRegion
L14_1 = L7_1
L15_1 = L9_1
L13_1(L14_1, L15_1)
L13_1 = mp
L13_1 = L13_1.INFECTED
return L13_1
