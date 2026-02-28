local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 16777215
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 5461830 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L0_1["SCRIPT:FlashExp_crypted_data"] = 1
L0_1["SCRIPT:FlashExp_rc4_key"] = 2
L0_1["SCRIPT:FlashExp_xor_key_int"] = 1
L0_1["SCRIPT:FlashExp_is_standalone"] = 1
L0_1["SCRIPT:FlashExp_is_win8_81_10"] = 2
L0_1["SCRIPT:FlashExp_is_win7_xp"] = 2
L0_1["SCRIPT:FlashExp_test_spray"] = 2
L0_1["SCRIPT:FlashExp_check_mem"] = 1
L0_1["SCRIPT:FlashExp_check_versions"] = 1
L0_1["SCRIPT:FlashExp_spray_obj"] = 2
L0_1["SCRIPT:FlashExp_get_big_ba"] = 1
L0_1["SCRIPT:FlashExp_skip_payload"] = 2
L0_1["SCRIPT:FlashExp_get_dummy_addr"] = 1
L0_1["SCRIPT:FlashExp_blowfish"] = 1
L0_1["SCRIPT:FlashExp_fill_obj1"] = 1
L0_1["SCRIPT:FlashExp_fill_obj4000"] = 2
L0_1["SCRIPT:FlashExp_surfstation"] = 2
L1_1 = 0
L2_1 = pairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = mp
  L7_1 = L7_1.get_mpattribute
  L8_1 = L5_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L1_1 = L1_1 + L6_1
  end
end
if 8 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
