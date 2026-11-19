-- Threat: !InfrastructureShared
-- Name: c778d49b46f1
-- Type: 21
-- Flags: 1

local l_0_0 = mp.GetHSTRCallerId()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.LOWFI
end
if pehdr.SizeOfImage >= 786432 and pehdr.SizeOfImage <= 851968 or pehdr.SizeOfImage >= 479232 and pehdr.SizeOfImage <= 520192 or pehdr.SizeOfImage >= 589824 and pehdr.SizeOfImage <= 606208 then
  return mp.INFECTED
end
mp.changedetectionname(805306378)
return mp.SUSPICIOUS
