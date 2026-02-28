local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.InternalName
if L1_1 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
else
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.getfilename
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L3_1()
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "(.+\\)([^\\]+)$"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L5_1 = string
L5_1 = L5_1.sub
L6_1 = L4_1
L7_1 = 1
L8_1 = 9
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == "uninstall" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L1_1
L7_1 = "utorrent"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "utweb"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    goto lbl_63
  end
end
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "PUA:Block:uTorrent"
L5_1(L6_1)
::lbl_63::
L5_1 = string
L5_1 = L5_1.find
L6_1 = L1_1
L7_1 = "bittorrent"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "btweb"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    goto lbl_85
  end
end
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "PUA:Block:BitTorrent"
L5_1(L6_1)
::lbl_85::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
