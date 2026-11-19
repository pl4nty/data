-- Threat: !InfrastructureShared
-- Name: !#Lua:SingleFileInZip
-- Type: 12

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0(p1_0, p1_1)
  if p1_1 ~= nil and p1_0 ~= nil then
    local r1_0 = mp.readu_u16(p1_0, p1_1 + 25)
    local r1_1 = p1_0:sub(p1_1 + 43, p1_1 + 42 + r1_0)
    return r1_0, r1_1
  end
  return nil
end

local function r0_1(p2_0)
  if p2_0 ~= nil and not (p2_0:len() < 4) then
    local r2_0 = {
      [".js"] = true, [".vbs"] = true, [".vbe"] = true, [".lnk"] = true, [".wsf"] = true,
      [".jse"] = true, [".hta"] = true, [".exe"] = true, [".dll"] = true, [".scr"] = true,
      [".pif"] = true, [".msi"] = true, [".jar"] = true, [".bat"] = true, [".cmd"] = true,
      [".com"] = true, [".ps1"] = true
    }
    local r2_1 = string.lower(string.sub(p2_0, -4))
    if r2_0[r2_1] then
      return string.sub(r2_1, -3)
    end
    if r2_0[string.sub(r2_1, -3)] then
      return string.sub(r2_1, -2)
    end
    return nil
  end
  return false
end

if not (mp.HEADERPAGE_SZ < 128) and not (mp.FOOTERPAGE_SZ < 22) then
  if mp.readu_u32(headerpage, 1) == 67324752 then
    local r0_2 = mp.getfilesize()
    if r0_2 <= 208 then
      return mp.CLEAN
    end
    local r0_3 = mp.FOOTERPAGE_SZ - 21
    local r0_4 = tostring(footerpage)
    if mp.readu_u32(footerpage, r0_3) ~= 101010256 then
      r0_3, _ = r0_4:find("PK\005\006", 1, true)
      if r0_3 == nil then
        return mp.CLEAN
      end
      if mp.readu_u16(footerpage, r0_3 + 20) > 0 then
        mp.set_mpattribute("Lua:ZipHasComment")
      end
    end
    mp.UfsSetMetadataBool("Lua:FileInZip", true)
    local r0_5 = mp.readu_u16(footerpage, r0_3 + 10)
    local r0_6 = mp.readu_u32(footerpage, r0_3 + 12)
    if r0_3 < r0_6 then
      local r0_7 = mp.FOOTERPAGE_SZ
      r0_7 = r0_6 + (r0_7 - r0_3) + 1
      r0_7 = r0_7 > 65536 and 65536 or r0_7
      local r0_8
      if r0_2 < r0_7 then
        r0_8 = r0_2
      else
        r0_8 = r0_7
      end
      mp.readprotection(false)
      local r0_9 = mp.readfile(r0_2 - r0_8, r0_8)
      mp.readprotection(true)
      if r0_9 ~= nil then
        r0_4 = r0_9
        r0_3 = r0_3 + r0_8 - mp.FOOTERPAGE_SZ
      end
    end
    local r0_10, r0_11 = 0, 0
    local r0_12, r0_13 = nil, nil
    local r0_14, r0_15 = r0_4:find("PK\001\002", 1, true)
    local r0_16
    if r0_15 == nil then
      r0_16 = r0_10
    else
      r0_16 = r0_10
      while r0_15 < r0_3 and r0_16 <= 500 do
        local r0_17, r0_18 = r0_0(r0_4, r0_15)
        local r0_19 = mp.readu_u16(r0_4, r0_15 + 27)
        local r0_20 = mp.readu_u16(r0_4, r0_15 + 29)
        if r0_18:sub(-1) == "/" then
          r0_13 = r0_18
        else
          r0_16 = r0_16 + 1
          r0_12 = r0_18
          local r0_21 = r0_1(r0_18)
          if r0_21 and r0_21 ~= "" then
            r0_11 = r0_11 + 1
            local r0_22 = mp.set_mpattribute
            local r0_23 = r0_21
            local r0_24 = "Lua:ZipHasFileWith!" .. r0_23
            r0_23 = nil
            r0_22(r0_24)
          end
        end
        r0_15 = r0_15 + r0_17 + r0_19 + r0_20 + 46
      end
    end
    local r0_25 = { 1, 5, 10, 25, 50, 100, 500 }
    for r0_26 = 2, #r0_25 do
      if r0_25[r0_26 - 1] >= r0_16 and r0_26 == 2 then
        local r0_27 = mp.set_mpattribute
        local r0_28 = r0_25[r0_26 - 1]
        local r0_29 = "LUA:ZipElementsLE" .. r0_28 .. ".A"
        r0_28 = nil
        r0_27(r0_29)
      elseif r0_25[r0_26] >= r0_16 and r0_25[r0_26 - 1] < r0_16 then
        local r0_30 = mp.set_mpattribute
        local r0_31 = r0_25[r0_26 - 1]
        local r0_32 = "LUA:ZipElementsGT" .. r0_31 .. ".A"
        r0_31 = nil
        r0_30(r0_32)
        r0_30 = mp.set_mpattribute
        r0_32 = "LUA:ZipElementsLE"
        local r0_33 = r0_25[r0_26]
        local r0_34 = r0_32 .. r0_33 .. ".A"
        r0_33 = nil
        r0_30(r0_34)
      elseif r0_25[r0_26] < r0_16 and r0_26 == #r0_25 then
        local r0_35 = mp.set_mpattribute
        local r0_36 = r0_25[r0_26]
        local r0_37 = "LUA:ZipElementsGT" .. r0_36 .. ".A"
        r0_36 = nil
        r0_35(r0_37)
      end
    end
    if r0_16 == 1 then
      if r0_11 == 1 then
        mp.set_mpattribute("Lua:SingleSuspiciousExtensionInZip")
      end
      if r0_5 == 1 then
        mp.set_mpattribute("Lua:SingleFileNoFoldersInZip")
      elseif r0_5 == 2 then
        mp.set_mpattribute("Lua:SingleFileInFoldersInZip")
        if r0_12 ~= nil and r0_13 ~= nil and r0_13 == r0_12:sub(0, r0_13:len()) then
          mp.set_mpattribute("Lua:FolderNameSameAsFileName")
        end
      else
        mp.set_mpattribute("Lua:SingleFileInNestedFoldersInZip")
      end
      if versioning.GetTestMode() ~= 401337 and mp.readu_u32(headerpage, 19) > 4194304 then
        return mp.CLEAN
      end
      local r0_38 = mp.readu_u16(headerpage, 27)
      local r0_39 = mp.readu_u32(headerpage, 31 + r0_38 - 4)
      if r0_39 == 1885960750 then
        mp.set_mpattribute("Lua:SingleZipInZip")
      end
      r0_39 = mp
      r0_39.UfsSetMetadataBool("Lua:SingleFileInZip", true)
      r0_39 = mp
      r0_39 = r0_39.INFECTED
      return r0_39
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
