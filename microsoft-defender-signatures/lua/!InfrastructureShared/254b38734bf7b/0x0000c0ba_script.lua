-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\254b38734bf7b\0x0000c0ba_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = ""
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[1]).utf8p2
  l_0_1 = "regasm.exe"
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    l_0_0 = (this_sigattrlog[2]).utf8p2
    l_0_1 = "regsvcs.exe"
  end
end
local l_0_2, l_0_3 = pcall(MpCommon.CommandLineToArgv, l_0_0)
if not l_0_2 or isnull(l_0_3) or type(l_0_3) ~= "table" or isnull(#l_0_3) then
  return mp.CLEAN
end
if #l_0_3 ~= 1 or l_0_3[1] == nil then
  return mp.CLEAN
end
if StringEndsWith((string.lower)(l_0_3[1]), l_0_1) then
  sms_untrusted_process()
  return mp.INFECTED
end
return mp.CLEAN

