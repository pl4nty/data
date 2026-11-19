-- Threat: !InfrastructureShared
-- Name: 7178c7e70382
-- Type: 21
-- Flags: 1

if peattributes.isexe ~= true then
  return mp.CLEAN
end
local l_0_0 = pesecs[pehdr.NumberOfSections].PointerToRawData + pesecs[pehdr.NumberOfSections].SizeOfRawData
mp.readprotection(false)
local l_0_1 = mp.readfile(l_0_0, 19)
local l_0_2 = {
  82,
  97,
  117,
  109,
  32,
  69,
  120,
  116,
  114,
  97,
  99,
  116,
  32,
  76,
  97,
  98,
  101,
  108,
  0
}
for l_0_3 = 1, 19 do
  if string.byte(l_0_1, l_0_3) ~= l_0_2[l_0_3] then
    mp.set_mpattribute("HSTR:TrojanDropper:Win32/Bindmaener_Lowfi")
    return mp.CLEAN
  end
end
if mp.HSTR_WEIGHT >= 10 then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:TrojanDropper:Win32/Bindmaener_Lowfi")
return mp.CLEAN
