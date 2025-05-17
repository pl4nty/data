-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb3c709b30c\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
  local l_0_0 = safeJsonDeserialize((this_sigattrlog[2]).utf8p2)
  if l_0_0 and l_0_0.gen_ransom_data then
    local l_0_1 = 0
    for l_0_5,l_0_6 in pairs(l_0_0.gen_ransom_data) do
      if ((l_0_0.gen_ransom_data)[l_0_5]).Entropy < 7 or tonumber(((l_0_0.gen_ransom_data)[l_0_5]).Filesize) ~= tonumber(((l_0_0.gen_ransom_data)[l_0_5]).WriteSize) or tonumber(((l_0_0.gen_ransom_data)[l_0_5]).Filesize) % 16 ~= 0 then
        return mp.CLEAN
      end
      local l_0_7 = (((l_0_0.gen_ransom_data)[l_0_5]).FilePath):match("%.[^%.]+$")
      local l_0_8 = ExtensionToMagicMismatch(l_0_7, ((l_0_0.gen_ransom_data)[l_0_5]).MagicByte)
      if l_0_8 ~= nil and l_0_8 == false then
        return mp.CLEAN
      end
      l_0_1 = l_0_1 + 1
    end
    if l_0_1 >= 5 then
      local l_0_9 = safeJsonSerialize(l_0_0)
      ;
      (bm.add_related_string)("ransom_meta", l_0_9, bm.RelatedStringBMReport)
      ;
      (bm.trigger_sig)("GenericRansomware:Type7", l_0_9)
      sms_untrusted_process()
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

