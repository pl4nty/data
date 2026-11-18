-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/PEFileChecks.A
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

if pehdr == nil or pehdr.NumberOfSections == nil or pesecs == nil then
  return mp.CLEAN
end
local l_0_0 = pehdr.NumberOfSections
local l_0_1 = pesecs[l_0_0].PointerToRawData + pesecs[l_0_0].SizeOfRawData
local l_0_2 = mp.getfilesize()
if l_0_1 == nil or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_1 > l_0_2 then
  mp.set_mpattribute("Lua:Context/PeFileTruncated.A!lastsection")
end
if 1 < l_0_0 then
  local l_0_3 = pesecs[l_0_0 - 1].PointerToRawData + pesecs[l_0_0 - 1].SizeOfRawData
  if l_0_3 ~= nil and l_0_2 < l_0_3 then
    mp.set_mpattribute("Lua:Context/PeFileTruncated.A!secondlastsection")
  end
end
return mp.CLEAN
