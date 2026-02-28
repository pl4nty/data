local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 16777215
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 5461830 then
  L0_1 = 0
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_check_spray_exp"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 2
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_decrypt_data"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 1
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_find_virtprot"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 1
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_is_vuln"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 1
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_prepare_shell"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 2
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_read_data"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 1
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_read_keys"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 1
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_run_payload"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 2
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_run_shell"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 2
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_sleep_end"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 1
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_spray_obj"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 2
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_test_spray"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 1
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_wait_and_run"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 1
  end
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCRIPT:FlashExp_shellcode"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = L0_1 + 3
  end
  if 10 <= L0_1 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
