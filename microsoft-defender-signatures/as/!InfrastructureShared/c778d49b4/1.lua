-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c778d49b4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetHSTRCallerId)()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.LOWFI
end
-- DECOMPILER ERROR at PC41: Unhandled construct in 'MakeBoolean' P3

if (pehdr.SizeOfImage >= 786432 and pehdr.SizeOfImage <= 851968) or pehdr.SizeOfImage < 479232 or pehdr.SizeOfImage >= 589824 and pehdr.SizeOfImage <= 606208 then
  return mp.INFECTED
end
;
(mp.changedetectionname)(805306378)
return mp.SUSPICIOUS

