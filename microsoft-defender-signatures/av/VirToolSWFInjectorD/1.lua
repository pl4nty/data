-- Threat: VirTool:SWF/Injector.D
-- Type: 13

if mp.bitand(mp.readu_u32(headerpage, 1), 16777215) ~= 5461830 then
  return mp.CLEAN
end
local l_0_0 = {
  ["SCRIPT:FlashExp_crypted_data"] = 1,
  ["SCRIPT:FlashExp_rc4_key"] = 2,
  ["SCRIPT:FlashExp_xor_key_int"] = 1,
  ["SCRIPT:FlashExp_is_standalone"] = 1,
  ["SCRIPT:FlashExp_is_win8_81_10"] = 2,
  ["SCRIPT:FlashExp_is_win7_xp"] = 2,
  ["SCRIPT:FlashExp_test_spray"] = 2,
  ["SCRIPT:FlashExp_check_mem"] = 1,
  ["SCRIPT:FlashExp_check_versions"] = 1,
  ["SCRIPT:FlashExp_spray_obj"] = 2,
  ["SCRIPT:FlashExp_get_big_ba"] = 1,
  ["SCRIPT:FlashExp_skip_payload"] = 2,
  ["SCRIPT:FlashExp_get_dummy_addr"] = 1,
  ["SCRIPT:FlashExp_blowfish"] = 1,
  ["SCRIPT:FlashExp_fill_obj1"] = 1,
  ["SCRIPT:FlashExp_fill_obj4000"] = 2,
  ["SCRIPT:FlashExp_surfstation"] = 2
}
local l_0_1 = 0
for l_0_2, l_0_3 in pairs(l_0_0) do
  if mp.get_mpattribute(l_0_2) then
    l_0_1 = l_0_1 + l_0_3
  end
end
if 8 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
