local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = {}
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L2_1 then
  L3_1 = pairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.ppid
    if L8_1 then
      L8_1 = L7_1.image_path
      if L8_1 then
        L8_1 = table
        L8_1 = L8_1.insert
        L9_1 = L0_1
        L10_1 = string
        L10_1 = L10_1.format
        L11_1 = "%s (%s)"
        L12_1 = L7_1.image_path
        L13_1 = L7_1.ppid
        L10_1, L11_1, L12_1, L13_1 = L10_1(L11_1, L12_1, L13_1)
        L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
        L8_1 = bm
        L8_1 = L8_1.add_threat_process
        L9_1 = L7_1.ppid
        L8_1(L9_1)
        L8_1 = MpCommon
        L8_1 = L8_1.SetTaintedProcess
        L9_1 = L7_1.ppid
        L10_1 = bm
        L10_1 = L10_1.BM_TAINT_OTHER
        L8_1(L9_1, L10_1)
      end
    end
  end
end
L3_1 = {}
L4_1 = mp
L4_1 = L4_1.SIGATTR_LOG_SZ
if 0 < L4_1 then
  L4_1 = mp
  L4_1 = L4_1.SIGATTR_LOG_SZ
  L5_1 = 1
  L6_1 = -1
  for L7_1 = L4_1, L5_1, L6_1 do
    L8_1 = sigattr_tail
    L8_1 = L8_1[L7_1]
    L8_1 = L8_1.utf8p1
    if L8_1 then
      L8_1 = sigattr_tail
      L8_1 = L8_1[L7_1]
      L8_1 = L8_1.attribute
      if L8_1 ~= 16384 then
        L8_1 = sigattr_tail
        L8_1 = L8_1[L7_1]
        L8_1 = L8_1.attribute
        if L8_1 ~= 16385 then
          goto lbl_84
        end
      end
      L8_1 = table
      L8_1 = L8_1.insert
      L9_1 = L3_1
      L10_1 = string
      L10_1 = L10_1.format
      L11_1 = "0x%x: %s"
      L12_1 = sigattr_tail
      L12_1 = L12_1[L7_1]
      L12_1 = L12_1.attribute
      L13_1 = sigattr_tail
      L13_1 = L13_1[L7_1]
      L13_1 = L13_1.utf8p1
      L10_1, L11_1, L12_1, L13_1 = L10_1(L11_1, L12_1, L13_1)
      L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
      L8_1 = bm
      L8_1 = L8_1.add_threat_file
      L9_1 = sigattr_tail
      L9_1 = L9_1[L7_1]
      L9_1 = L9_1.utf8p1
      L8_1(L9_1)
    end
    ::lbl_84::
  end
end
L4_1 = safeJsonSerialize
L5_1 = {}
L5_1.CreatedProcs = L0_1
L5_1.CreatedFiles = L3_1
L4_1 = L4_1(L5_1)
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "SuspiciousHTTPRequestHeaders_Activity"
L7_1 = L4_1
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = bm
L5_1 = L5_1.set_detection_string
L6_1 = L4_1
L5_1(L6_1)
L5_1 = bm
L5_1 = L5_1.get_current_process_startup_info
L5_1 = L5_1()
if L5_1 then
  L6_1 = L5_1.ppid
  if L6_1 then
    L6_1 = TrackPidAndTechniqueBM
    L7_1 = L5_1.ppid
    L8_1 = "T1071.001"
    L9_1 = "c2_http"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = isnull
    L7_1 = this_sigattrlog
    L7_1 = L7_1[1]
    L7_1 = L7_1.utf8p2
    L6_1 = L6_1(L7_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = this_sigattrlog
      L7_1 = L7_1[1]
      L7_1 = L7_1.utf8p2
      L8_1 = "DestPort=80;"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L6_1 = TrackPidAndTechniqueBM
        L7_1 = L5_1.ppid
        L8_1 = "T1571"
        L9_1 = "c2_http_nonstandardport"
        L6_1(L7_1, L8_1, L9_1)
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
