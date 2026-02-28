local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = false
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p1
  if L5_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[1]
    L6_1 = L6_1.utf8p1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = L4_1
    L7_1 = "(.-)([^\\]-)$"
    L5_1, L6_1 = L5_1(L6_1, L7_1)
    L1_1 = L6_1
    _ = L5_1
  end
end
L5_1 = this_sigattrlog
L5_1 = L5_1[2]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[2]
  L5_1 = L5_1.utf8p1
  if L5_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[2]
    L6_1 = L6_1.utf8p1
    L5_1 = L5_1(L6_1)
    L6_1 = string
    L6_1 = L6_1.match
    L7_1 = L5_1
    L8_1 = "(.-)([^\\]-)$"
    L6_1, L7_1 = L6_1(L7_1, L8_1)
    L2_1 = L7_1
    _ = L6_1
  end
end
if L1_1 ~= nil and L2_1 ~= nil and L1_1 == L2_1 then
  L0_1 = true
end
L5_1 = this_sigattrlog
L5_1 = L5_1[3]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[3]
  L5_1 = L5_1.utf8p1
  if L5_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = this_sigattrlog
    L6_1 = L6_1[3]
    L6_1 = L6_1.utf8p1
    L5_1 = L5_1(L6_1)
    L6_1 = string
    L6_1 = L6_1.match
    L7_1 = L5_1
    L8_1 = "(.-)([^\\]-)$"
    L6_1, L7_1 = L6_1(L7_1, L8_1)
    L3_1 = L7_1
    _ = L6_1
  end
end
if L1_1 ~= nil and L3_1 ~= nil and L1_1 == L3_1 then
  L0_1 = true
end
if L0_1 == true then
  L5_1 = bm
  L5_1 = L5_1.get_process_relationships
  L5_1, L6_1 = L5_1()
  L7_1 = ipairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = mp
    L12_1 = L12_1.bitand
    L13_1 = L11_1.reason_ex
    L14_1 = bm
    L14_1 = L14_1.RELATIONSHIP_CREATED
    L12_1 = L12_1(L13_1, L14_1)
    L13_1 = bm
    L13_1 = L13_1.RELATIONSHIP_CREATED
    if L12_1 == L13_1 then
      L13_1 = string
      L13_1 = L13_1.lower
      L14_1 = MpCommon
      L14_1 = L14_1.PathToWin32Path
      L15_1 = L11_1.image_path
      L14_1, L15_1, L16_1 = L14_1(L15_1)
      L13_1 = L13_1(L14_1, L15_1, L16_1)
      if L4_1 == L13_1 then
        L13_1 = TrackPidAndTechniqueBM
        L14_1 = L11_1.ppid
        L15_1 = "T1055.002"
        L16_1 = "processinjection_target_t"
        L13_1(L14_1, L15_1, L16_1)
        L13_1 = bm
        L13_1 = L13_1.request_SMS
        L14_1 = L11_1.ppid
        L15_1 = "M"
        L13_1(L14_1, L15_1)
        L13_1 = bm
        L13_1 = L13_1.add_action
        L14_1 = "SmsAsyncScanEvent"
        L15_1 = 1000
        L13_1(L14_1, L15_1)
      end
    end
    L13_1 = mp
    L13_1 = L13_1.bitand
    L14_1 = L11_1.reason_ex
    L15_1 = bm
    L15_1 = L15_1.RELATIONSHIP_INJECTION
    L13_1 = L13_1(L14_1, L15_1)
    L12_1 = L13_1
    L13_1 = bm
    L13_1 = L13_1.RELATIONSHIP_INJECTION
    if L12_1 == L13_1 then
      L13_1 = TrackPidAndTechniqueBM
      L14_1 = L11_1.ppid
      L15_1 = "T1055.002"
      L16_1 = "processinjection_target_t"
      L13_1(L14_1, L15_1, L16_1)
      L13_1 = bm
      L13_1 = L13_1.request_SMS
      L14_1 = L11_1.ppid
      L15_1 = "M"
      L13_1(L14_1, L15_1)
      L13_1 = bm
      L13_1 = L13_1.add_action
      L14_1 = "SmsAsyncScanEvent"
      L15_1 = 1000
      L13_1(L14_1, L15_1)
    end
  end
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
