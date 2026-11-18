-- Threat: !InfrastructureShared
-- Name: !#Lua:TechsnabCAB
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 1178817357 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 27) ~= 1 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 29) == 1 then
  mp.set_mpattribute("Lua:TopLevelSingleFileCAB")
elseif mp.readu_u16(headerpage, 29) == 2 then
  mp.set_mpattribute("Lua:TopLevelDoubleFileCAB")
else
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 5) ~= 0 then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u32(headerpage, 9)
if l_0_0 < 65536 or 786432 < l_0_0 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 17) ~= 44 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 31) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 33) ~= 1234 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 35) ~= 0 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u32(headerpage, 37)
if 1008 < l_0_1 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, l_0_1 + 1) ~= 0 then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:PossibleTechsnabCAB")
if mp.ENGINEBUILD > 12140 then
  return mp.CLEAN
end
local l_0_2 = l_0_1 + 8
local l_0_3
if l_0_0 > mp.getfilesize() then
  l_0_3 = mp.getfilesize() - l_0_2
else
  l_0_3 = l_0_0 - l_0_2
end
mp.readprotection(false)
local l_0_4 = mp.readfile(l_0_2, l_0_3)
mp.vfo_add_buffer(l_0_4, "[CABDATA]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
