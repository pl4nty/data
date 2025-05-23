-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db31b633391\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
  l_0_0 = (this_sigattrlog[2]).utf8p1
end
extractRansomNote(l_0_0)
sms_untrusted_process()
return mp.INFECTED

