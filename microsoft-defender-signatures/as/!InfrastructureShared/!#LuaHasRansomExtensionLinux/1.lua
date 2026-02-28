local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 ~= nil and L0_1 ~= "" then
  L1_1 = #L0_1
  if not (L1_1 < 4) then
    goto lbl_16
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_16::
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "([^/]+)$"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "(%.[^%.%s]+)%s*$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = ""
  L2_1 = L3_1 or L2_1
  if not L3_1 then
  end
end
if L2_1 ~= "" then
  L3_1 = {}
  L3_1["._locked"] = true
  L3_1[".akira"] = true
  L3_1[".avos"] = true
  L3_1[".avos2"] = true
  L3_1[".avoslinux"] = true
  L3_1[".avos2j"] = true
  L3_1[".ifire"] = true
  L3_1[".kitty"] = true
  L3_1[".basta"] = true
  L3_1[".blackbyte"] = true
  L3_1[".blacksuit"] = true
  L3_1[".cerber"] = true
  L3_1[".cerber2"] = true
  L3_1[".cerber3"] = true
  L3_1[".conti"] = true
  L3_1[".cryptolocker"] = true
  L3_1[".coaq"] = true
  L3_1[".cosakos"] = true
  L3_1[".cuba"] = true
  L3_1[".cymcrypt"] = true
  L3_1[".dark_power"] = true
  L3_1[".devil"] = true
  L3_1[".dharma"] = true
  L3_1[".eight"] = false
  L3_1[".encryptedyourfiles"] = true
  L3_1[".enigma"] = false
  L3_1[".everest"] = false
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
  L3_1[".royal_u"] = true
  L3_1[".rsnslocked"] = true
  L3_1[".shino"] = true
  L3_1[".thor"] = false
  L3_1[".tury"] = true
  L3_1[".venus"] = true
  L3_1[".v-society"] = true
  L3_1[".weon"] = true
  L3_1[".wikon"] = true
  L3_1[".wncry"] = true
  L3_1[".wncryt"] = true
  L3_1[".zatp"] = true
  L3_1[".zepto"] = true
  L3_1[".flocked"] = true
  L5_1 = L2_1
  L4_1 = L2_1.lower
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L5_1 = MpCommon
      L5_1 = L5_1.BmTriggerSig
      L6_1 = L4_1
      L7_1 = "BM_HasRansomExtensionLinux"
      L8_1 = L0_1
      L5_1(L6_1, L7_1, L8_1)
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
