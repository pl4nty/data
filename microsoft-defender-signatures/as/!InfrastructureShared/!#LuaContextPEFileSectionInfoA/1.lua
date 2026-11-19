-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/PEFileSectionInfo.A
-- Type: 8
-- MpAttributes: RPF:TopLevelFile

if pehdr == nil or pehdr.NumberOfSections == nil or pesecs == nil then
  return mp.CLEAN
end
local l_0_0 = pehdr.NumberOfSections
if l_0_0 == nil then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:Context/PeFileNumberOfSections!" .. tostring(l_0_0))
if l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = "Lua:Context/PeFileSection"
for l_0_2 = 1, l_0_0 do
  local l_0_3 = pesecs[l_0_2].Name
  if pesecs[l_0_2].Name ~= nil then
    mp.set_mpattribute(l_0_1 .. tostring(l_0_2) .. "!" .. string.lower(l_0_3))
  end
  if 8 <= l_0_2 then
    break
  end
end
return mp.CLEAN
