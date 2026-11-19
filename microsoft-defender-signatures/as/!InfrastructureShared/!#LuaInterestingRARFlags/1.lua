-- Threat: !InfrastructureShared
-- Name: !#Lua:InterestingRARFlags
-- Type: 12

local function l_0_0(l_1_0)
  local l_1_1 = headerpage[l_1_0 + 2]
  
  if l_1_1 == 122 and l_1_0 + 48 < mp.HEADERPAGE_SZ then
    if headerpage[l_1_0 + 26] == 3 and mp.readu_u16(headerpage, l_1_0 + 32) == 19779 and headerpage[l_1_0 + 34] == 84 then
      mp.set_mpattribute("Lua:RarHasCommentBlock")
    end
  elseif l_1_1 == 116 and l_1_0 + 128 < mp.HEADERPAGE_SZ then
    if headerpage[l_1_0 + 25] == 48 then
      mp.set_mpattribute("Lua:RarHasStoredFile")
    end
    local l_1_2 = mp.readu_u16(headerpage, l_1_0 + 3)
    if mp.bitand(l_1_2, 4) == 4 then
      mp.set_mpattribute("Lua:RarHasEncryptedFile")
    end
    local l_1_3 = mp.readu_u32(headerpage, l_1_0 + 7)
    local l_1_4 = mp.readu_u32(headerpage, l_1_0 + 11)
    local l_1_5 = 80
    if l_1_3 ~= 0 and 104857600 < l_1_4 and l_1_5 < l_1_4 / l_1_3 then
      mp.set_mpattribute("Lua:RarHasHighlyCompressedFile")
      local l_1_6 = l_1_4 / l_1_3
      if 100 <= l_1_6 then
        mp.set_mpattribute("//RarCompressionRatioGTE100")
      end
      if 250 <= l_1_6 then
        mp.set_mpattribute("//RarCompressionRatioGTE250")
      end
      if 500 <= l_1_6 then
        mp.set_mpattribute("//RarCompressionRatioGTE500")
      end
      if 1000 <= l_1_6 then
        mp.set_mpattribute("//RarCompressionRatioGTE1000")
      end
    end
    local l_1_7 = mp.readu_u16(headerpage, l_1_0 + 26)
    if 4 < l_1_7 and l_1_7 < 96 then
      local l_1_8 = 32
      if mp.bitand(l_1_2, 256) == 256 then
        l_1_8 = l_1_8 + 8
      end
      for l_1_9 = 0, l_1_7 do
        if mp.bitor(mp.readu_u32(headerpage, l_1_0 + l_1_8 + l_1_9), 538976288) == 1936941424 and mp.bitor(mp.readu_u32(headerpage, l_1_0 + l_1_8 + l_1_9 + 4), 538976288) == 1685221239 then
          mp.set_mpattribute("Lua:RarHasFileNameWithPassword")
          break
        end
      end
      local l_1_10 = {
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
        [829648942] = "",
        [1918986798] = "",
        [1668511534] = "",
        [1752397614] = ""
      }
      local l_1_11 = mp.bitor(mp.readu_u32(headerpage, l_1_0 + l_1_8 + l_1_7 - 4), 538976288)
      local l_1_12 = mp.bitand(l_1_11, 4294967040)
      if l_1_10[l_1_11] or l_1_10[l_1_12] then
        mp.set_mpattribute("Lua:RarHasFileWithExeExtension")
        if mp.bitand(l_1_2, 4) == 4 then
          mp.set_mpattribute("Lua:RarHasEncryptedFileWithExeExtension")
        end
        if headerpage[l_1_0 + 25] == 48 then
          mp.set_mpattribute("Lua:RarHasStoredFileWithExeExtension")
        end
      end
    end
  end
  return l_1_0 + mp.readu_u16(headerpage, l_1_0 + 5) + mp.readu_u32(headerpage, l_1_0 + 7)
end

if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 561144146 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 5) ~= 1818 then
  return mp.CLEAN
end
if headerpage[7] == 1 then
  mp.set_mpattribute("Lua:Rar50")
  if headerpage[14] == 4 then
    mp.set_mpattribute("Lua:RarHasEncryptionHeader")
  end
elseif headerpage[7] == 0 then
  mp.set_mpattribute("Lua:Rar4x")
  local l_0_1 = mp.readu_u16(headerpage, 11)
  if mp.bitand(l_0_1, 128) == 128 then
    mp.set_mpattribute("Lua:RarHasEncryptionHeader")
  end
end
local l_0_2 = 21
local l_0_3 = 0
while l_0_3 < 3 and l_0_2 + 4 < mp.HEADERPAGE_SZ do
  l_0_2 = l_0_0(l_0_2)
  l_0_3 = l_0_3 + 1
end
return mp.CLEAN
