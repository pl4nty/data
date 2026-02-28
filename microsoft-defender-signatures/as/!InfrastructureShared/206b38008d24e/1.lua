local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = "%\\TimeProviders%\\+(.-)%\\"
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = isnull
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = isnull
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L2_1 = isnull
        L3_1 = this_sigattrlog
        L3_1 = L3_1[4]
        L3_1 = L3_1.utf8p1
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          L2_1 = isnull
          L3_1 = this_sigattrlog
          L3_1 = L3_1[5]
          L3_1 = L3_1.utf8p1
          L2_1 = L2_1(L3_1)
          if not L2_1 then
            goto lbl_48
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_48::
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.utf8p2
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.utf8p2
L4_1 = mp
L4_1 = L4_1.ContextualExpandEnvironmentVariables
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = isnull
L6_1 = L2_1
L5_1 = L5_1(L6_1)
if L5_1 and L4_1 == "c:\\windows\\system32\\w32time.dll" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.IsKnownFriendlyFile
L6_1 = L3_1
L7_1 = false
L8_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = this_sigattrlog
L6_1 = L6_1[2]
L6_1 = L6_1.utf8p1
L7_1 = L0_1
L5_1 = L5_1(L6_1, L7_1)
L6_1 = string
L6_1 = L6_1.match
L7_1 = this_sigattrlog
L7_1 = L7_1[3]
L7_1 = L7_1.utf8p1
L8_1 = L0_1
L6_1 = L6_1(L7_1, L8_1)
L7_1 = string
L7_1 = L7_1.match
L8_1 = this_sigattrlog
L8_1 = L8_1[4]
L8_1 = L8_1.utf8p1
L9_1 = L0_1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = string
L8_1 = L8_1.match
L9_1 = this_sigattrlog
L9_1 = L9_1[5]
L9_1 = L9_1.utf8p1
L10_1 = L0_1
L8_1 = L8_1(L9_1, L10_1)
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
      if not L9_1 and L5_1 == L6_1 and L6_1 == L7_1 and L6_1 == L8_1 then
        goto lbl_149
      end
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_149::
if L5_1 == "vmwTimeProvider" and L4_1 == "c:\\program files\\vmware\\vmware tools\\vmwtimeprovider\\vmwtimeprovider.dll" then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
if L4_1 == "c:\\windows\\system32\\sel_3390_time_provider.dll" then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = TrackPidAndTechniqueBM
L10_1 = L1_1.ppid
L11_1 = "T1547.003"
L12_1 = "persist_timeprovider"
L9_1(L10_1, L11_1, L12_1)
L9_1 = mp
L9_1 = L9_1.GetParentProcInfo
L9_1 = L9_1()
if L9_1 then
  L10_1 = L9_1.ppid
  if L10_1 then
    L10_1 = TrackPidAndTechniqueBM
    L11_1 = L9_1.ppid
    L12_1 = "T1547.003"
    L13_1 = "persist_timeprovider"
    L10_1(L11_1, L12_1, L13_1)
    L10_1 = bm
    L10_1 = L10_1.add_threat_process
    L11_1 = L9_1.ppid
    L10_1(L11_1)
  end
end
L10_1 = bm
L10_1 = L10_1.add_threat_file
L11_1 = L3_1
L10_1(L11_1)
L10_1 = bm
L10_1 = L10_1.add_related_string
L11_1 = "TimeProvider"
L12_1 = safeJsonSerialize
L13_1 = {}
L14_1 = L9_1.ppid
L13_1.Parent = L14_1
L13_1.ProviderName = L6_1
L13_1.ProviderDLL = L3_1
L14_1 = L2_1 or L14_1
if not L2_1 then
  L14_1 = "N/A"
end
L13_1.PreviousDLL = L14_1
L12_1 = L12_1(L13_1)
L13_1 = bm
L13_1 = L13_1.RelatedStringBMReport
L10_1(L11_1, L12_1, L13_1)
L10_1 = mp
L10_1 = L10_1.INFECTED
return L10_1
