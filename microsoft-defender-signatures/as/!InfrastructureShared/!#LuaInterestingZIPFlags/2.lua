-- Threat: !InfrastructureShared
-- Name: !#Lua:InterestingZipFlags
-- Type: 12

local function l_0_0(l_1_0, l_1_1)
  local l_1_2 = {
    [1952539182] = "",
    
    [1684890414] = "",
    [1836016430] = "",
    [1819304750] = "",
    [1702389038] = "",
    [1718186030] = "",
    [1919120174] = "",
    [1935832622] = "",
    [1802398766] = "",
    [1718843182] = "",
    [1700951598] = "",
    [1702062638] = "",
    [1635018798] = "",
    [1936338432] = "",
    [1819042862] = "",
    [2019782446] = "",
    [1918986798] = "",
    [1668511534] = "",
    [1752397614] = ""
  }
  local l_1_3 = mp.bitor(mp.readu_u32(l_1_0, l_1_1), 538976288)
  local l_1_4 = mp.bitand(l_1_3, 4294967040)
  if l_1_2[l_1_3] or l_1_2[l_1_4] then
    return true
  end
  return false
end

local function l_0_1(l_2_0)
  if mp.readu_u32(footerpage, l_2_0 + 1) == 33639248 and l_2_0 + 48 < mp.FOOTERPAGE_SZ then
    local l_2_1 = 47
    local l_2_2 = mp.readu_u16(footerpage, l_2_0 + 29)
    if mp.bitand(mp.readu_u16(footerpage, l_2_0 + 9), 1) == 1 and 4 < l_2_2 and l_2_0 + l_2_1 + l_2_2 < mp.FOOTERPAGE_SZ and l_0_0(footerpage, l_2_0 + l_2_1 + l_2_2 - 4) then
      return true, 0
    end
    local l_2_3 = l_2_0 + l_2_1 + l_2_2 + mp.readu_u16(footerpage, l_2_0 + 31) - 1
    return false, l_2_3
  end
end

if not mp.IsHipsRuleEnabled("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 67324752 then
  return mp.CLEAN
end
if mp.bitand(mp.readu_u16(headerpage, 7), 1) ~= 1 then
  return mp.CLEAN
end
local l_0_2 = 31
local l_0_3 = mp.readu_u16(headerpage, 27)
if 4 < l_0_3 and l_0_2 + l_0_3 < mp.HEADERPAGE_SZ and l_0_0(headerpage, l_0_2 + l_0_3 - 4) then
  mp.set_mpattribute("Lua:ZipHasEncryptedFileWithExeExtension")
  return mp.CLEAN
end
local l_0_4 = mp.getfilesize()
local l_0_5 = mp.FOOTERPAGE_SZ - 21
if mp.readu_u32(footerpage, l_0_5) ~= 101010256 then
  local l_0_6 = tostring(footerpage)
  local l_0_7 = l_0_6:find("PK\005\006", 1, true)
  if l_0_7 == nil then
    return mp.CLEAN
  end
end
local l_0_8 = mp.readu_u32(footerpage, l_0_5 + 16)
local l_0_9 = 0
if l_0_4 < mp.FOOTERPAGE_SZ then
  l_0_9 = l_0_8
else
  l_0_9 = l_0_8 - l_0_4 + mp.FOOTERPAGE_SZ
end
local l_0_10 = 0
local l_0_11
while l_0_10 < 3 and l_0_9 + 4 < mp.FOOTERPAGE_SZ do
  l_0_11, l_0_9 = l_0_1(l_0_9)
  if l_0_11 then
    mp.set_mpattribute("Lua:ZipHasEncryptedFileWithExeExtension")
    return mp.CLEAN
  end
  l_0_10 = l_0_10 + 1
end
return mp.CLEAN
