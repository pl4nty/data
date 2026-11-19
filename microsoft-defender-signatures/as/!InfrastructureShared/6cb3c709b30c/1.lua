-- Threat: !InfrastructureShared
-- Name: 6cb3c709b30c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  local l_0_0 = safeJsonDeserialize(this_sigattrlog[2].utf8p2)
  if l_0_0 and l_0_0.gen_ransom_data then
    local l_0_1 = 0
    for l_0_2, l_0_3 in pairs(l_0_0.gen_ransom_data) do
      if l_0_0.gen_ransom_data[l_0_2].Entropy < 7 or tonumber(l_0_0.gen_ransom_data[l_0_2].Filesize) ~= tonumber(l_0_0.gen_ransom_data[l_0_2].WriteSize) or tonumber(l_0_0.gen_ransom_data[l_0_2].Filesize) % 16 ~= 0 then
        return mp.CLEAN
      end
      local l_0_4 = l_0_0.gen_ransom_data[l_0_2].FilePath:match("%.[^%.]+$")
      local l_0_5 = ExtensionToMagicMismatch(l_0_4, l_0_0.gen_ransom_data[l_0_2].MagicByte)
      if l_0_5 ~= nil and l_0_5 == false then
        return mp.CLEAN
      end
      l_0_1 = l_0_1 + 1
    end
    if 5 <= l_0_1 then
      local l_0_6 = safeJsonSerialize(l_0_0)
      bm.add_related_string("ransom_meta", l_0_6, bm.RelatedStringBMReport)
      bm.trigger_sig("GenericRansomware:Type7", l_0_6)
      sms_untrusted_process()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
