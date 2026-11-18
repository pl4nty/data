-- Threat: !InfrastructureShared
-- Name: !#Lua:ContIOAVRetelesh.B
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

if pehdr.DllCharacteristics ~= 0 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[4].RVA ~= 0 or pehdr.DataDirectory[4].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.Machine ~= 332 then
  return mp.CLEAN
end
local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil then
  return mp.CLEAN
end
pe.set_peattribute("enable_vmm_grow", true)
pe.set_peattribute("deep_analysis", true)
return mp.INFECTED
