-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb333a28c90\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.CLEAN
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
  l_0_0 = reportGenericRansomware((this_sigattrlog[3]).utf8p2)
else
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 then
    l_0_0 = reportGenericRansomware((this_sigattrlog[4]).utf8p2)
  end
end
local l_0_1 = ""
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  l_0_1 = (this_sigattrlog[1]).utf8p1
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    l_0_1 = (this_sigattrlog[2]).utf8p1
  end
end
if l_0_1 ~= "" then
  extractRansomNote(l_0_1)
end
if l_0_0 == mp.INFECTED then
  reportTimingData()
  sms_untrusted_process()
  return mp.INFECTED
end
return mp.CLEAN

