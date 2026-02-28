local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L1_1 = true
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L0_1 = L4_1.utf8p2
end
if L0_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/tmp/"
  L7_1 = 1
  L8_1 = true
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L3_1 = L5_1
  L2_1 = L4_1
  if L2_1 ~= nil and L3_1 ~= nil then
    L1_1 = false
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/var/tmp/"
  L7_1 = 1
  L8_1 = true
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L3_1 = L5_1
  L2_1 = L4_1
  if L2_1 ~= nil and L3_1 ~= nil then
    L1_1 = false
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/var/mail/"
  L7_1 = 1
  L8_1 = true
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L3_1 = L5_1
  L2_1 = L4_1
  if L2_1 ~= nil and L3_1 ~= nil then
    L1_1 = false
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/var/lock/"
  L7_1 = 1
  L8_1 = true
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L3_1 = L5_1
  L2_1 = L4_1
  if L2_1 ~= nil and L3_1 ~= nil then
    L1_1 = false
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/home/"
  L7_1 = 1
  L8_1 = true
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L3_1 = L5_1
  L2_1 = L4_1
  if L2_1 ~= nil and L3_1 ~= nil then
    L1_1 = false
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/root/"
  L7_1 = 1
  L8_1 = true
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L3_1 = L5_1
  L2_1 = L4_1
  if L2_1 ~= nil and L3_1 ~= nil then
    L1_1 = false
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/dev/shm/"
  L7_1 = 1
  L8_1 = true
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L3_1 = L5_1
  L2_1 = L4_1
  if L2_1 ~= nil and L3_1 ~= nil then
    L1_1 = false
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/var/spool/mail/"
  L7_1 = 1
  L8_1 = true
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  L3_1 = L5_1
  L2_1 = L4_1
  if L2_1 ~= nil and L3_1 ~= nil then
    L1_1 = false
  end
end
if L1_1 == false then
  L4_1 = bm
  L4_1 = L4_1.get_current_process_startup_info
  L4_1 = L4_1()
  L5_1 = bm
  L5_1 = L5_1.get_process_relationships
  L6_1 = L4_1.ppid
  L5_1, L6_1 = L5_1(L6_1)
  L7_1 = ipairs
  L8_1 = L5_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = bm
    L12_1 = L12_1.add_related_process
    L13_1 = L11_1.ppid
    L12_1(L13_1)
    L12_1 = TrackPidAndTechniqueBM
    L13_1 = L11_1.ppid
    L14_1 = "T1547.006"
    L15_1 = "Persistence"
    L12_1(L13_1, L14_1, L15_1)
  end
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
