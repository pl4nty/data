local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.sub
  L3_1 = 1
  L4_1 = 2
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 ~= "\\\\" then
    L2_1 = L0_1
    L1_1 = L0_1.sub
    L3_1 = 1
    L4_1 = 3
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 ~= "\"\\\\" then
      L2_1 = L0_1
      L1_1 = L0_1.sub
      L3_1 = 1
      L4_1 = 3
      L1_1 = L1_1(L2_1, L3_1, L4_1)
      if L1_1 ~= "'\\\\" then
        goto lbl_71
      end
    end
  end
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "remoteauditservice.exe$"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "sartorius.com\\.+\\smstsvc"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "\\\\.+\\c%$\\"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "\\\\.+\\admin%$\\"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      goto lbl_71
    end
  end
  L1_1 = bm
  L1_1 = L1_1.add_threat_file
  L2_1 = L0_1
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_71::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
