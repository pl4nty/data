local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L0_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.wp2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L1_1 = L2_1.utf8p2
  end
end
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "-iname"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "-name"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "-iregex"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "-regex"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          goto lbl_114
        end
      end
    end
  end
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "/root/"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "/home/ "
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      goto lbl_114
    end
  end
  L2_1 = isTainted
  L3_1 = L0_1
  L4_1 = "remote_file_created_taint"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L0_1
  L4_1 = 0
  L5_1 = 5
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 ~= "/tmp/" then
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L0_1
    L4_1 = 0
    L5_1 = 9
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 ~= "/var/tmp/" then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L0_1
      L4_1 = 0
      L5_1 = 9
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if L2_1 ~= "/dev/shm/" then
        goto lbl_114
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_114::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
