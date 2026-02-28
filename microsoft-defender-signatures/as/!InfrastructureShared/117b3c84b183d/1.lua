local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L0_1 = L2_1[2]
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L0_1 = L2_1[3]
  else
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = isnull
L3_1 = L0_1.utf8p1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = L0_1.utf8p2
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_33
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_33::
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1.utf8p1
L4_1 = "imagename:(.+);targetprocessppid:(%d+):(%d+)$"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L5_1 = string
L5_1 = L5_1.match
L6_1 = L0_1.utf8p2
L7_1 = "vmbaseaddress:(.+);[a-z]-regionsize:(%d+);"
L5_1, L6_1 = L5_1(L6_1, L7_1)
L7_1 = isnull
L8_1 = L2_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = isnull
  L8_1 = L3_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    L7_1 = isnull
    L8_1 = L4_1
    L7_1 = L7_1(L8_1)
    if not L7_1 then
      L7_1 = isnull
      L8_1 = L5_1
      L7_1 = L7_1(L8_1)
      if not L7_1 then
        L7_1 = isnull
        L8_1 = L6_1
        L7_1 = L7_1(L8_1)
        if not L7_1 then
          goto lbl_71
        end
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_71::
L7_1 = mp
L7_1 = L7_1.SIGATTR_LOG_SZ
if L7_1 == 0 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.SIGATTR_LOG_SZ
L8_1 = 1
L9_1 = -1
for L10_1 = L7_1, L8_1, L9_1 do
  L11_1 = sigattr_tail
  L11_1 = L11_1[L10_1]
  if not L1_1 then
    L12_1 = isnull
    L13_1 = L11_1.attribute
    L12_1 = L12_1(L13_1)
    if not L12_1 then
      L12_1 = isnull
      L13_1 = L11_1.utf8p1
      L12_1 = L12_1(L13_1)
      if not L12_1 then
        L12_1 = isnull
        L13_1 = L11_1.np2
        L12_1 = L12_1(L13_1)
        if not L12_1 then
          L12_1 = L11_1.attribute
          if L12_1 == 16427 then
            L12_1 = L11_1.np2
            if 2031616 <= L12_1 then
              L12_1 = string
              L12_1 = L12_1.match
              L13_1 = L11_1.utf8p1
              L14_1 = "^..*\\(.+)$"
              L12_1 = L12_1(L13_1, L14_1)
              L13_1 = isnull
              L14_1 = L12_1
              L13_1 = L13_1(L14_1)
              if not L13_1 and L2_1 == L12_1 then
                L1_1 = true
              end
            end
          end
        end
      end
    end
  end
end
if not L1_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.format
L8_1 = "Injected at least %d bytes into %s (PID:%d) at %s"
L9_1 = L6_1
L10_1 = L2_1
L11_1 = L3_1
L12_1 = tostring
L13_1 = L5_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L8_1 = bm
L8_1 = L8_1.add_related_string
L9_1 = "CodeInjectSummary"
L10_1 = L7_1
L11_1 = bm
L11_1 = L11_1.RelatedStringBMReport
L8_1(L9_1, L10_1, L11_1)
L8_1 = bm
L8_1 = L8_1.get_current_process_startup_info
L8_1 = L8_1()
L9_1 = isnull
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = isnull
  L10_1 = L8_1.ppid
  L9_1 = L9_1(L10_1)
  if not L9_1 then
    L9_1 = TrackPidAndTechniqueBM
    L10_1 = L8_1.ppid
    L11_1 = "T1055"
    L12_1 = "processinjection"
    L9_1(L10_1, L11_1, L12_1)
  end
end
L9_1 = string
L9_1 = L9_1.format
L10_1 = "pid:%d,ProcessStart:%d"
L11_1 = L3_1
L12_1 = L4_1
L9_1 = L9_1(L10_1, L11_1, L12_1)
L10_1 = TrackPidAndTechniqueBM
L11_1 = L9_1
L12_1 = "T1055"
L13_1 = "processinjection_target"
L10_1(L11_1, L12_1, L13_1)
L10_1 = bm
L10_1 = L10_1.add_related_process
L11_1 = L9_1
L10_1(L11_1)
L10_1 = TriggerTargetedMemoryScan
L11_1 = L5_1
L12_1 = L9_1
L10_1(L11_1, L12_1)
L10_1 = AddSuspiciousRegion
L11_1 = L5_1
L12_1 = L9_1
L10_1(L11_1, L12_1)
L10_1 = mp
L10_1 = L10_1.INFECTED
return L10_1
