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
        goto lbl_72
      end
    end
  end
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "\\\\.+\\c%$\\"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = TrackFileAndTechnique
    L2_1 = L0_1
    L3_1 = "T1543.003:remote_svc_img_cdollar"
    L4_1 = 8000
    L1_1(L2_1, L3_1, L4_1)
  else
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "\\\\.+\\admin%$\\"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = TrackFileAndTechnique
      L2_1 = L0_1
      L3_1 = "T1543.003:remote_svc_img_adminshare"
      L4_1 = 8000
      L1_1(L2_1, L3_1, L4_1)
    else
      L1_1 = TrackFileAndTechnique
      L2_1 = L0_1
      L3_1 = "T1543.003:remote_svc_img_rndshare"
      L4_1 = 8000
      L1_1(L2_1, L3_1, L4_1)
    end
  end
  L1_1 = bm
  L1_1 = L1_1.add_related_file
  L2_1 = L0_1
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_72::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
