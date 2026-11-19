-- Threat: !InfrastructureShared
-- Name: 4c788ec13a17
-- Type: 21

if peattributes.isdll ~= true and peattributes.hasexports ~= true then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 20000 and 60000 < l_0_0 then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint ~= 0 or pehdr.ImageBase ~= 4194304 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pe.get_exports()
if 2 <= l_0_1 and l_0_1 <= 5 then
  return mp.INFECTED
end
return mp.CLEAN
