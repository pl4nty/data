-- Threat: !InfrastructureShared
-- Name: 9b278d8fa2e1d
-- Type: 21
-- Flags: 1

if mp.get_mpattribute("Themida_Attr") ~= true then
  return mp.CLEAN
end
if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections < 7 then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 8 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections - 1].Characteristics ~= 3758096448 then
  return mp.CLEAN
end
local l_0_0 = pehdr.DataDirectory[1].RVA
local l_0_1 = pehdr.DataDirectory[2].Size
if pe.contains_rva(pehdr.NumberOfSections - 1, l_0_0) ~= true then
  return mp.CLEAN
end
if l_0_1 ~= 149 then
  return mp.CLEAN
end
return mp.INFECTED
