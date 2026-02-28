local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p1
  L2_1 = L2_1(L3_1)
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L1_1 = L3_1.utf8p2
  L0_1 = L2_1
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L1_1 = L3_1.utf8p2
    L0_1 = L2_1
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L1_1 = L3_1.utf8p2
      L0_1 = L2_1
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[5]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L3_1 = L3_1.utf8p1
        L2_1 = L2_1(L3_1)
        L3_1 = this_sigattrlog
        L3_1 = L3_1[5]
        L1_1 = L3_1.utf8p2
        L0_1 = L2_1
      end
    end
  end
end
L2_1 = isnull
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L2_1 = L2_1.matched
    if L2_1 then
      goto lbl_82
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_82::
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = isnull
  L4_1 = L2_1.ppid
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_98
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_98::
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = string
L4_1 = L4_1.lower
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.utf8p1
L4_1 = L4_1(L5_1)
L5_1 = "..*\\"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = string
L4_1 = L4_1.lower
L5_1 = this_sigattrlog
L5_1 = L5_1[6]
L5_1 = L5_1.utf8p1
L4_1 = L4_1(L5_1)
if L3_1 ~= L0_1 or L3_1 ~= L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = this_sigattrlog
L6_1 = L6_1[6]
L6_1 = L6_1.utf8p2
L7_1 = "TargetPPID:(%d+):(%d+);"
L5_1, L6_1 = L5_1(L6_1, L7_1)
L7_1 = isnull
L8_1 = L5_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = isnull
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if not L7_1 then
    goto lbl_142
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_142::
L7_1 = string
L7_1 = L7_1.format
L8_1 = "pid:%d,ProcessStart:%d"
L9_1 = L5_1
L10_1 = L6_1
L7_1 = L7_1(L8_1, L9_1, L10_1)
L8_1 = L2_1.ppid
if L8_1 == L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = false
L9_1 = bm
L9_1 = L9_1.get_process_relationships
L10_1 = L7_1
L9_1 = L9_1(L10_1)
L10_1 = isnull
L11_1 = L9_1
L10_1 = L10_1(L11_1)
if not L10_1 then
  L10_1 = #L9_1
  if L10_1 ~= 0 then
    goto lbl_171
  end
end
L10_1 = true
L11_1 = {}
L9_1 = L11_1
L8_1 = L10_1
::lbl_171::
L10_1 = pairs
L11_1 = L9_1
L10_1, L11_1, L12_1 = L10_1(L11_1)
for L13_1, L14_1 in L10_1, L11_1, L12_1 do
  L15_1 = L14_1.ppid
  L16_1 = L2_1.ppid
  if L15_1 == L16_1 then
    L8_1 = true
  end
end
if not L8_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = {}
L11_1 = mp
L11_1 = L11_1.SIGATTR_LOG_SZ
if L11_1 == 0 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.SIGATTR_LOG_SZ
L12_1 = 1
L13_1 = -1
for L14_1 = L11_1, L12_1, L13_1 do
  L15_1 = sigattr_tail
  L15_1 = L15_1[L14_1]
  L16_1 = isnull
  L17_1 = L15_1.attribute
  L16_1 = L16_1(L17_1)
  if not L16_1 then
    L16_1 = L15_1.attribute
    if L16_1 == 16522 then
      L16_1 = isnull
      L17_1 = L15_1.utf8p1
      L16_1 = L16_1(L17_1)
      if not L16_1 then
        L16_1 = isnull
        L17_1 = L15_1.utf8p2
        L16_1 = L16_1(L17_1)
        if not L16_1 then
          L16_1 = string
          L16_1 = L16_1.find
          L17_1 = L15_1.utf8p1
          L18_1 = L5_1
          L19_1 = ":"
          L20_1 = L6_1
          L18_1 = L18_1 .. L19_1 .. L20_1
          L16_1 = L16_1(L17_1, L18_1)
          if L16_1 then
            L16_1 = string
            L16_1 = L16_1.find
            L17_1 = L15_1.utf8p2
            L18_1 = L1_1
            L16_1 = L16_1(L17_1, L18_1)
            if L16_1 then
              L16_1 = string
              L16_1 = L16_1.match
              L17_1 = L15_1.utf8p2
              L18_1 = "vmbaseaddress:(%d+);vm[a-z]+:(%d+)"
              L16_1, L17_1 = L16_1(L17_1, L18_1)
              L18_1 = isnull
              L19_1 = L16_1
              L18_1 = L18_1(L19_1)
              if not L18_1 then
                L18_1 = isnull
                L19_1 = L17_1
                L18_1 = L18_1(L19_1)
                if not L18_1 then
                  L18_1 = tonumber
                  L19_1 = L17_1
                  L18_1 = L18_1(L19_1)
                  if 8 < L18_1 then
                    L18_1 = AddSuspiciousRegion
                    L19_1 = L16_1
                    L20_1 = L7_1
                    L18_1(L19_1, L20_1)
                    L18_1 = bm
                    L18_1 = L18_1.VirtualQuery
                    L19_1 = L16_1
                    L20_1 = L7_1
                    L18_1, L19_1 = L18_1(L19_1, L20_1)
                    if L18_1 == true then
                      L20_1 = L19_1.prot
                      if 16 <= L20_1 then
                        L20_1 = L19_1.prot
                        if L20_1 <= 128 then
                          goto lbl_280
                        end
                      end
                      L20_1 = L19_1.alloc_prot
                      if 16 <= L20_1 then
                        L20_1 = L19_1.alloc_prot
                        ::lbl_280::
                        if L20_1 <= 128 then
                          L20_1 = table
                          L20_1 = L20_1.insert
                          L21_1 = L10_1
                          L22_1 = string
                          L22_1 = L22_1.format
                          L23_1 = "{BaseAddress=%s;Size=%s;State=%x;Prot=%x;AllocProt=%x;}"
                          L24_1 = L16_1
                          L25_1 = L19_1.size
                          L26_1 = L19_1.state_type
                          L27_1 = L19_1.prot
                          L28_1 = L19_1.alloc_prot
                          L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L22_1(L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
                          L20_1(L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
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
L11_1 = isnull
L12_1 = L10_1
L11_1 = L11_1(L12_1)
if L11_1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = table
L11_1 = L11_1.sort
L12_1 = L10_1
L11_1(L12_1)
L11_1 = table
L11_1 = L11_1.concat
L12_1 = L10_1
L13_1 = ","
L11_1 = L11_1(L12_1, L13_1)
L12_1 = string
L12_1 = L12_1.format
L13_1 = "{Name=%s;PPID=%s;WriteMethod=%s;SuspiciousRegions=[%s];}"
L14_1 = L0_1
L15_1 = L7_1
L16_1 = L1_1
L17_1 = L11_1
L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
L13_1 = bm
L13_1 = L13_1.add_related_string
L14_1 = "HollowedProcessDetails"
L15_1 = L12_1
L16_1 = bm
L16_1 = L16_1.RelatedStringBMReport
L13_1(L14_1, L15_1, L16_1)
L13_1 = TrackPidAndTechniqueBM
L14_1 = L2_1.ppid
L15_1 = "T1055.012"
L16_1 = "processhollow"
L13_1(L14_1, L15_1, L16_1)
L13_1 = TrackPidAndTechniqueBM
L14_1 = L7_1
L15_1 = "T1055.012"
L16_1 = "processhollow_target"
L13_1(L14_1, L15_1, L16_1)
L13_1 = bm
L13_1 = L13_1.add_related_process
L14_1 = L7_1
L13_1(L14_1)
L13_1 = MpCommon
L13_1 = L13_1.SetTaintedProcess
L14_1 = L7_1
L15_1 = bm
L15_1 = L15_1.BM_TAINT_OTHER
L13_1(L14_1, L15_1)
L13_1 = mp
L13_1 = L13_1.INFECTED
return L13_1
