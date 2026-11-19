-- Threat: !InfrastructureShared
-- Name: !#Lua:Java.SuspiciousCrypter
-- Type: 13
-- MpAttributes: !MpIsStreamScan

if mp.HEADERPAGE_SZ < 128 or mp.FOOTERPAGE_SZ < 22 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 67324752 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 16777216 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.FOOTERPAGE_SZ - 21
if mp.readu_u32(footerpage, l_0_1) ~= 101010256 then
  local l_0_2 = 276
  local l_0_3 = mp.readfile(l_0_0 - l_0_2, l_0_2)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  l_0_1 = string.find(l_0_3, "PK\005\006", 1, true)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = l_0_1 + mp.FOOTERPAGE_SZ - l_0_2
end
local l_0_4 = mp.readu_u16(footerpage, l_0_1 + 10)
local l_0_5 = mp.readu_u32(footerpage, l_0_1 + 12)
local l_0_6 = mp.readu_u32(footerpage, l_0_1 + 16)
local l_0_7 = mp.readfile(l_0_6, l_0_5)
if l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = 700
local l_0_9 = 0
local l_0_10 = 0
local l_0_11 = 0
local l_0_12 = 0
local l_0_13 = 0
local l_0_14 = 0
local l_0_15 = false
local l_0_16 = false
local l_0_17 = false
local l_0_18 = {}
local l_0_19 = 0
local l_0_20 = 1
if mp.readu_u32(l_0_7, l_0_20) ~= 33639248 then
  return mp.CLEAN
end
while l_0_20 ~= nil do
  l_0_9 = l_0_9 + 1
  local l_0_21 = mp.readu_u16(l_0_7, l_0_20 + 28)
  local l_0_22 = string.sub(l_0_7, l_0_20 + 46, l_0_20 + 46 + l_0_21 - 1)
  local l_0_23 = mp.readu_u32(l_0_7, l_0_20 + 24)
  local l_0_24 = mp.readu_u16(l_0_7, l_0_20 + 12)
  local l_0_25 = mp.readu_u16(l_0_7, l_0_20 + 14)
  if 6 <= l_0_21 and l_0_22 ~= nil then
    local l_0_26 = string.lower(string.sub(l_0_22, -6))
    if l_0_26 == ".class" then
      l_0_10 = l_0_10 + 1
    elseif string.find(l_0_26, ".b64", 3, true) == 3 then
      l_0_11 = l_0_11 + 1
    elseif (string.find(l_0_22, "com/", 1, true) == 1 or string.find(l_0_22, "net/", 1, true) == 1) and string.find(l_0_22, ".", 1, true) == nil and string.sub(l_0_22, -1) ~= "/" then
      l_0_12 = l_0_12 + 1
    end
    if l_0_19 <= 100 then
      l_0_26 = string.match(l_0_26, "%.(.*)")
      if l_0_26 ~= nil and l_0_26 ~= "class" and l_0_26 ~= "b64" and l_0_26 ~= "mf" and l_0_18[l_0_26] == nil then
        l_0_18[l_0_26] = true
        l_0_19 = l_0_19 + 1
      end
    end
    if l_0_17 == false then
      local l_0_27 = string.find(l_0_22, "[0-9]")
      if l_0_27 ~= nil and string.sub(l_0_22, l_0_27 - 1, l_0_27 - 1) ~= "$" then
        l_0_17 = true
      end
    end
    if string.find(l_0_22, "META-INF/", 1, true) == 1 and l_0_22 ~= "META-INF/MANIFEST.MF" then
      l_0_14 = l_0_14 + 1
    end
  end
  local l_0_28 = l_0_20 + 46 + l_0_21
  if l_0_22 == "META-INF/MANIFEST.MF" then
    local l_0_29 = MpCommon.DosTimeToFileTime(l_0_24, l_0_25)
    local l_0_30 = MpCommon.TimeTToFileTime(MpCommon.GetCurrentTimeT())
    if l_0_29 ~= 0 and l_0_29 < l_0_30 then
      local l_0_31 = 864000000000
      l_0_15 = l_0_30 - l_0_29 <= 15 * l_0_31
    end
    if mp.readu_u32(l_0_7, l_0_28) == 51966 then
      l_0_28 = l_0_28 + 4
    end
    if l_0_23 <= 150 then
      l_0_16 = true
    end
    l_0_13 = l_0_13 + 1
  end
  l_0_20 = nil
  if l_0_5 > l_0_28 and mp.readu_u32(l_0_7, l_0_28) == 33639248 then
    l_0_20 = l_0_28
  end
  if l_0_8 < l_0_9 then
    break
  end
end
if l_0_16 then
  mp.set_mpattribute("//Lua:JarManifestSizeLT150")
end
if l_0_17 == false then
  mp.set_mpattribute("//Lua:JarNoNumberInFilenames")
end
if 1 <= l_0_12 then
  mp.set_mpattribute("//Lua:JarNoExtFiles")
  if 10 <= l_0_12 then
    mp.set_mpattribute("//Lua:JarNoExtFilesGE10")
  end
  if 25 <= l_0_12 then
    mp.set_mpattribute("//Lua:JarNoExtFilesGE25")
  end
  if 50 <= l_0_12 then
    mp.set_mpattribute("//Lua:JarNoExtFilesGE50")
  end
  if 100 <= l_0_12 then
    mp.set_mpattribute("//Lua:JarNoExtFilesGE100")
  end
end
if 10 <= l_0_19 then
  mp.set_mpattribute("//Lua:JarDifferentExtsInsideGE10")
  if 25 <= l_0_19 then
    mp.set_mpattribute("//Lua:JarDifferentExtsInsideGE25")
  end
  if 50 <= l_0_19 then
    mp.set_mpattribute("//Lua:JarDifferentExtsInsideGE50")
  end
  if 100 <= l_0_19 then
    mp.set_mpattribute("//Lua:JarDifferentExtsInsideGE100")
  end
end
if l_0_10 == 0 then
  mp.set_mpattribute("//Lua:JarNoClassFilesInside")
elseif l_0_10 == 1 then
  mp.set_mpattribute("//Lua:JarSingleClassFileInside")
elseif 5 <= l_0_10 then
  mp.set_mpattribute("//Lua:JarClassFilesInsideGE5")
  if 10 <= l_0_10 then
    mp.set_mpattribute("//Lua:JarClassFilesInsideGE10")
  end
  if 25 <= l_0_10 then
    mp.set_mpattribute("//Lua:JarClassFilesInsideGE25")
  end
  if 50 <= l_0_10 then
    mp.set_mpattribute("//Lua:JarClassFilesInsideGE50")
  end
  if 100 <= l_0_10 then
    mp.set_mpattribute("//Lua:JarClassFilesInsideGE100")
  end
end
if 1 <= l_0_14 then
  mp.set_mpattribute("//Lua:JarMoreFilesInMetaInf")
end
if l_0_4 - l_0_13 - l_0_10 == l_0_19 and 10 <= l_0_19 then
  mp.set_mpattribute("//Lua:JarDifferentExtsAllFiles")
end
if 15 <= l_0_10 and 50 <= l_0_12 and l_0_13 == 1 and l_0_11 == 0 and l_0_15 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.Loose.A")
end
if 400 <= l_0_12 and l_0_13 == 1 and l_0_11 == 0 and l_0_15 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.Loose.B")
end
if 10 <= l_0_10 and 10 <= l_0_12 and l_0_13 == 1 and l_0_15 and l_0_16 and l_0_17 == false then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.Loose.C")
end
if 25 <= l_0_10 and l_0_10 <= 55 and 100 <= l_0_12 and l_0_12 <= 150 and l_0_13 == 1 and l_0_15 and 450000 <= l_0_0 and l_0_0 <= 700000 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.JRAT")
elseif 200 <= l_0_10 and l_0_10 <= 250 and 300 <= l_0_12 and l_0_12 <= 500 and l_0_13 == 1 and l_0_15 and 580000 <= l_0_0 and l_0_0 <= 720000 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.JRAT.B")
elseif 200 <= l_0_10 and l_0_10 <= 250 and 40 <= l_0_12 and l_0_12 <= 100 and l_0_13 == 1 and l_0_15 and 100000 <= l_0_0 and l_0_0 <= 170000 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.JRAT.C")
elseif 25 <= l_0_10 and l_0_10 <= 40 and (450 <= l_0_12 and l_0_12 <= 550 or 180 <= l_0_12 and l_0_12 <= 250) and l_0_13 == 1 and l_0_15 and 580000 <= l_0_0 and l_0_0 <= 720000 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.JRAT.D")
elseif 100 <= l_0_10 and l_0_10 <= 300 and (100 <= l_0_12 and l_0_12 <= 200 or 400 <= l_0_12 and l_0_12 <= 600 or 1500 <= l_0_12 and l_0_12 <= 2000) and l_0_13 == 1 and l_0_15 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.JRAT.E")
elseif 15 <= l_0_10 and l_0_10 <= 50 and 120 <= l_0_12 and l_0_12 <= 280 and l_0_13 == 1 and l_0_15 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.JRAT.F")
elseif l_0_10 == 0 and l_0_12 == 700 and l_0_13 == 1 and l_0_15 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.JRAT.G")
elseif 40 <= l_0_10 and l_0_10 <= 70 and 300 <= l_0_12 and l_0_12 <= 500 and l_0_13 == 1 and l_0_15 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.JRAT.H")
elseif l_0_10 == 1 and l_0_12 == 0 and l_0_13 == 1 and l_0_15 and 90 <= l_0_19 and 100000 <= l_0_0 and l_0_0 <= 700000 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.JRAT.J")
elseif 20 <= l_0_10 and l_0_10 <= 55 and 150 <= l_0_12 and l_0_12 <= 250 and l_0_13 == 1 and l_0_15 and 200000 <= l_0_0 and l_0_0 <= 320000 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.QRAT")
elseif 26 <= l_0_10 and l_0_10 <= 40 and 9 <= l_0_12 and l_0_12 <= 18 and l_0_13 == 1 and l_0_15 and 48000 <= l_0_0 and l_0_0 <= 62000 and 15 <= l_0_11 and l_0_11 <= 17 then
  mp.set_mpattribute("//Lua:Java.SuspiciousCrypter.QRAT.B")
end
return mp.CLEAN
