-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb32417ba8c\1.luac 

-- params : ...
-- function num : 0
sms_untrusted_process()
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 and reportGenericRansomware((this_sigattrlog[2]).utf8p2, true) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN

