-- Threat: !InfrastructureShared
-- Name: !#Lua:Miuref_DLL_Appdata
-- Type: 10
-- MpAttributes: Themida_Attr

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 6 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections - 1].Characteristics ~= 3758096448 then
  return mp.CLEAN
end
local l_0_0 = pehdr.DataDirectory[1].RVA
local l_0_1 = pehdr.DataDirectory[2].Size
if mp.getfilesize() > 1324032 then
  return mp.CLEAN
end
if mp.getfilesize() < 1142784 then
  return mp.CLEAN
end
if pe.contains_rva(5, l_0_0) ~= true then
  return mp.CLEAN
end
if l_0_1 ~= 149 then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_2 == mp.SCANREASON_ONOPEN or l_0_2 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_3 == nil then
    return mp.CLEAN
  end
  if string.match(l_0_3, "\\appdata\\local\\%w+$") or string.match(l_0_3, "\\local settings\\application data\\%w+$") then
    mp.set_mpattribute("Lua:Miuref_DLL_Appdata")
  end
end
return mp.CLEAN
