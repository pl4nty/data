-- Threat: Rogue:VBS/FakePAV
-- Type: 13

if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 1) ~= 33328 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 5) ~= 2250901766 or mp.readu_u32(headerpage, 9) ~= 234325576 or mp.readu_u16(headerpage, 13) ~= 1793 or headerpage[15] ~= 2 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:SignedVBEVBSFile", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = tostring(headerpage)
local l_0_3 = l_0_2:find("\006\t*\134H\134\247\r\001\t\001", 176, true)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = mp.crc32(-1, l_0_2, l_0_3, 128)
if l_0_4 == 1253964061 then
  return mp.INFECTED
end
if l_0_4 == 2001072022 then
  return mp.INFECTED
end
if l_0_4 == 528523446 then
  return mp.INFECTED
end
if l_0_4 == 436171478 then
  return mp.INFECTED
end
if l_0_4 == 3846734772 then
  return mp.INFECTED
end
if l_0_4 == 2453401516 then
  return mp.INFECTED
end
if l_0_4 == 1904120670 then
  return mp.INFECTED
end
if l_0_4 == 1282814643 then
  return mp.INFECTED
end
if l_0_4 == 3099783027 then
  return mp.INFECTED
end
if l_0_4 == 1988786358 then
  return mp.INFECTED
end
if l_0_4 == 2685115694 then
  return mp.INFECTED
end
if l_0_4 == 3427567834 then
  return mp.INFECTED
end
if l_0_4 == 1626672047 then
  return mp.INFECTED
end
if l_0_4 == 216580452 then
  return mp.INFECTED
end
if l_0_4 == 3328643055 then
  return mp.INFECTED
end
if l_0_4 == 2585924740 then
  return mp.INFECTED
end
if l_0_4 == 3984502722 then
  return mp.INFECTED
end
if l_0_4 == 3084158829 then
  return mp.INFECTED
end
if l_0_4 == 642584810 then
  return mp.INFECTED
end
if l_0_4 == 2067526196 then
  return mp.INFECTED
end
if l_0_4 == 2955266051 then
  return mp.INFECTED
end
if l_0_4 == 3877293981 then
  return mp.INFECTED
end
if l_0_4 == 559314150 then
  return mp.INFECTED
end
if l_0_4 == 2836382494 then
  return mp.INFECTED
end
if l_0_4 == 3206025137 then
  return mp.INFECTED
end
if l_0_4 == 4272565023 then
  return mp.INFECTED
end
if l_0_4 == 260598575 then
  return mp.INFECTED
end
if l_0_4 == 3431717411 then
  return mp.INFECTED
end
if l_0_4 == 994572658 then
  return mp.INFECTED
end
if l_0_4 == 4158500031 then
  return mp.INFECTED
end
if not mp.get_mpattribute("RPF:AnyFileHasIOAVURL") then
  return mp.CLEAN
end
local l_0_5, l_0_6 = mp.UfsGetMetadataBool("Lua:SignedVBEVBSTopFile", true)
if l_0_5 ~= 0 or not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = l_0_2:find("\006\003U\004\n\f\bPersonal1.0.\006\003U\004\003\f.Open Source Developer,", l_0_3 - 96, false)
if l_0_7 ~= nil then
  return mp.INFECTED
end
l_0_7 = l_0_2:find("\006\003U\004\n\f\nIndividual1.0.\006\003U\004\003\f.Open Source Developer,", l_0_3 - 96, false)
if l_0_7 ~= nil then
  return mp.INFECTED
end
l_0_7 = l_0_2:find("1.0.\006\003U\004\003\f.Open Source Developer,", l_0_3 - 96, false)
if l_0_7 ~= nil then
  l_0_7 = l_0_2:find("1.0.\006\003U\004\v\019\030Certum Certification Authority1.0.\006\003U\004\003\019\019Certum Level III CA", 176, false)
  if l_0_7 ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
