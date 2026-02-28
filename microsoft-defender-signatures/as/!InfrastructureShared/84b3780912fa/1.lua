local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L0_1 = L1_1.utf8p2
    end
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = safeJsonDeserialize
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.appended_ext
if not L2_1 then
  L2_1 = nil
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.trigger_sig
L4_1 = "GenericRansomware:Extension"
L5_1 = L2_1
L3_1(L4_1, L5_1)
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "GenericRansomware:Extension"
L5_1 = L2_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = {}
L3_1["._locked"] = true
L3_1[".akira"] = true
L3_1[".basta"] = true
L3_1[".blackbyte"] = true
L3_1[".blacksuit"] = true
L3_1[".cerber"] = true
L3_1[".cerber2"] = true
L3_1[".cerber3"] = true
L3_1[".cryptolocker"] = true
L3_1[".coaq"] = true
L3_1[".cosakos"] = true
L3_1[".cuba"] = true
L3_1[".cymcrypt"] = true
L3_1[".dark_power"] = true
L3_1[".devil"] = true
L3_1[".dharma"] = true
L3_1[".eight"] = true
L3_1[".encryptedyourfiles"] = true
L3_1[".enigma"] = true
L3_1[".everest"] = true
L3_1[".fargo"] = true
L3_1[".foty"] = true
L3_1[".fs0ciety"] = true
L3_1[".gatz"] = true
L3_1[".gazprom"] = true
L3_1[".hack0"] = true
L3_1[".itlock3"] = true
L3_1[".itlock4"] = true
L3_1[".jyos"] = true
L3_1[".karma"] = true
L3_1[".kigatsu"] = true
L3_1[".kitz"] = true
L3_1[".l0cked"] = true
L3_1[".lockbit"] = true
L3_1[".locky"] = true
L3_1[".mallox"] = true
L3_1[".malox"] = true
L3_1[".medusa"] = true
L3_1[".met@n"] = true
L3_1[".neqp"] = true
L3_1[".niwm"] = true
L3_1[".nokonoko"] = true
L3_1[".nokoyawa"] = true
L3_1[".pandora"] = true
L3_1[".play"] = true
L3_1[".proton"] = true
L3_1[".qotr"] = true
L3_1[".quantum"] = true
L3_1[".ranzylocked"] = true
L3_1[".rook"] = true
L3_1[".royal"] = true
L3_1[".royal_w"] = true
L3_1[".rsnslocked"] = true
L3_1[".shino"] = true
L3_1[".thor"] = true
L3_1[".tury"] = true
L3_1[".venus"] = true
L3_1[".v-society"] = true
L3_1[".weon"] = true
L3_1[".wikon"] = true
L3_1[".wncry"] = true
L3_1[".wncryt"] = true
L3_1[".zatp"] = true
L3_1[".zepto"] = true
L4_1 = L3_1[L2_1]
if L4_1 == true then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
