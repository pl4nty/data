-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb37483165c\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
  (bm.add_related_string)("ransom_meta", (this_sigattrlog[2]).utf8p2, bm.RelatedStringBMReport)
  sms_untrusted_process()
  return mp.INFECTED
end
return mp.CLEAN

