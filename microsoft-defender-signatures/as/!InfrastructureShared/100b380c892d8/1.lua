local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = ""
L1_1 = ""
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
    if L0_1 ~= "" then
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L0_1
      L2_1(L3_1)
    end
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[5]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
    if L1_1 ~= "" then
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L1_1
      L2_1(L3_1)
    end
  end
end
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.ppid
  if L3_1 ~= nil then
    L3_1 = bm
    L3_1 = L3_1.request_SMS
    L4_1 = L2_1.ppid
    L5_1 = "M"
    L3_1(L4_1, L5_1)
    L3_1 = bm
    L3_1 = L3_1.add_action
    L4_1 = "SmsAsyncScanEvent"
    L5_1 = 3000
    L3_1(L4_1, L5_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
