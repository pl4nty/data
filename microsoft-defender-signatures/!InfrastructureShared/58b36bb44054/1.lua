-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\58b36bb44054\1.luac 

-- params : ...
-- function num : 0
sms_untrusted_process()
reportSessionInformation()
reportTimingData()
if (this_sigattrlog[1]).matched then
  (bm.add_related_string)("NamedPipeImpersonation", safeJsonSerialize(this_sigattrlog[1]), bm.RelatedStringBMReport)
end
return mp.INFECTED

