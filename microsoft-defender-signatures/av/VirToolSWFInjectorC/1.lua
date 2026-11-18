-- Threat: VirTool:SWF/Injector.C
-- Type: 13

if mp.bitand(mp.readu_u32(headerpage, 1), 16777215) == 5461830 then
  local l_0_0 = 0
  if mp.get_mpattribute("SCRIPT:FlashExp_check_spray_exp") then
    l_0_0 = l_0_0 + 2
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_decrypt_data") then
    l_0_0 = l_0_0 + 1
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_find_virtprot") then
    l_0_0 = l_0_0 + 1
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_is_vuln") then
    l_0_0 = l_0_0 + 1
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_prepare_shell") then
    l_0_0 = l_0_0 + 2
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_read_data") then
    l_0_0 = l_0_0 + 1
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_read_keys") then
    l_0_0 = l_0_0 + 1
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_run_payload") then
    l_0_0 = l_0_0 + 2
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_run_shell") then
    l_0_0 = l_0_0 + 2
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_sleep_end") then
    l_0_0 = l_0_0 + 1
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_spray_obj") then
    l_0_0 = l_0_0 + 2
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_test_spray") then
    l_0_0 = l_0_0 + 1
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_wait_and_run") then
    l_0_0 = l_0_0 + 1
  end
  if mp.get_mpattribute("SCRIPT:FlashExp_shellcode") then
    l_0_0 = l_0_0 + 3
  end
  if 10 <= l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
