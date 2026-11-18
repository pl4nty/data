-- Threat: !InfrastructureShared
-- Name: !#LUA:SmallZipWithLargeFile
-- Type: 13
-- MpAttributes: BM_ZIP_FILE & RPF:TopLevelFile & (RPF:AnyFileHasIOAVURL | Lua:OutlookAttachZip)

if mp.HEADERPAGE_SZ < 128 or mp.FOOTERPAGE_SZ < 22 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
local l_0_1 = 276
if l_0_0 <= l_0_1 then
  return mp.CLEAN
end
if 10000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_2 = mp.FOOTERPAGE_SZ - 21
if mp.readu_u32(footerpage, l_0_2) ~= 101010256 then
  mp.readprotection(false)
  local l_0_3 = mp.readfile(l_0_0 - l_0_1, l_0_1)
  mp.readprotection(true)
  l_0_2 = string.find(l_0_3, "PK\005\006", 1, true)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  if l_0_2 == nil then
    return mp.CLEAN
  end
  l_0_2 = l_0_2 + mp.FOOTERPAGE_SZ - l_0_1
end
local l_0_4 = mp.readu_u32(footerpage, l_0_2 + 12)
local l_0_5 = mp.readu_u32(footerpage, l_0_2 + 16)
if l_0_0 < l_0_5 + l_0_4 then
  return mp.CLEAN
end
local l_0_6 = 338
local l_0_7 = mp.readu_u16(footerpage, l_0_2 + 10)
local l_0_8 = 700
if l_0_7 > l_0_8 then
  l_0_7 = l_0_8
end
if l_0_4 > l_0_6 * l_0_7 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_9 = mp.readfile(l_0_5, l_0_4)
mp.readprotection(true)
if l_0_9 == nil then
  return mp.CLEAN
end
local l_0_10 = 0
local l_0_11 = 1
local l_0_12 = 80
local l_0_13 = 0
if mp.readu_u32(l_0_9, l_0_11) ~= 33639248 then
  return mp.CLEAN
end
local l_0_14 = {
  [".doc"] = "",
  [".docm"] = "",
  [".dotm"] = "",
  [".dot"] = "",
  [".xls"] = "",
  [".xlsm"] = "",
  [".ppt"] = "",
  [".pptm"] = "",
  [".exe"] = "",
  [".dll"] = "",
  [".scr"] = ""
}
local l_0_15 = false
while l_0_11 ~= nil do
  l_0_10 = l_0_10 + 1
  local l_0_16 = mp.readu_u16(l_0_9, l_0_11 + 28)
  local l_0_17 = mp.readu_u32(l_0_9, l_0_11 + 38)
  local l_0_18 = string.sub(l_0_9, l_0_11 + 46, l_0_11 + 46 + l_0_16 - 1)
  if l_0_18 ~= nil then
    l_0_18 = string.lower(l_0_18)
  end
  local l_0_19 = l_0_18:sub(-5)
  local l_0_20 = l_0_19:sub(-4)
  if l_0_14[l_0_20] ~= nil or l_0_14[l_0_19] ~= nil then
    local l_0_21 = mp.readu_u32(l_0_9, l_0_11 + 24)
    local l_0_22 = mp.readu_u32(l_0_9, l_0_11 + 20)
    if 268435456 < l_0_21 and 0 < l_0_22 and l_0_12 < l_0_21 / l_0_22 then
      l_0_13 = l_0_21 / l_0_22
      mp.set_mpattribute("LUA:SmallZipWithLargeFile")
    end
  end
  if l_0_15 == false and mp.bitand(l_0_17, 2) == 2 and mp.bitand(l_0_17, 16) ~= 16 then
    l_0_15 = true
    mp.set_mpattribute("Lua:ZipHasHiddenFile")
  end
  local l_0_23 = l_0_11 + 46 + l_0_16 + 36
  l_0_11 = nil
  if l_0_4 > l_0_23 and mp.readu_u32(l_0_9, l_0_23) == 33639248 then
    l_0_11 = l_0_23
  else
    break
  end
  if l_0_7 < l_0_10 then
    break
  end
end
if 100 <= l_0_13 then
  mp.set_mpattribute("//ZipCompressionRatioGTE100")
end
if 250 <= l_0_13 then
  mp.set_mpattribute("//ZipCompressionRatioGTE250")
end
if 500 <= l_0_13 then
  mp.set_mpattribute("//ZipCompressionRatioGTE500")
end
if 1000 <= l_0_13 then
  mp.set_mpattribute("//ZipCompressionRatioGTE1000")
end
return mp.CLEAN
