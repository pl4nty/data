-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9ff_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  if l_1_1 ~= nil and l_1_0 ~= nil then
    local l_1_2 = (mp.readu_u16)(l_1_0, l_1_1 + 25)
    local l_1_3 = l_1_0:sub(l_1_1 + 43, l_1_1 + 42 + l_1_2)
    return l_1_2, l_1_3
  end
  do
    return nil
  end
end

local l_0_1 = function(l_2_0)
  -- function num : 0_1
  if l_2_0 == nil or l_2_0:len() < 4 then
    return false
  end
  local l_2_1 = {}
  l_2_1[".js"] = true
  l_2_1[".vbs"] = true
  l_2_1[".vbe"] = true
  l_2_1[".lnk"] = true
  l_2_1[".wsf"] = true
  l_2_1[".jse"] = true
  l_2_1[".hta"] = true
  l_2_1[".exe"] = true
  l_2_1[".dll"] = true
  l_2_1[".scr"] = true
  l_2_1[".pif"] = true
  l_2_1[".msi"] = true
  l_2_1[".jar"] = true
  l_2_1[".bat"] = true
  l_2_1[".cmd"] = true
  l_2_1[".com"] = true
  l_2_1[".ps1"] = true
  local l_2_2 = (string.lower)((string.sub)(l_2_0, -4))
  if l_2_1[l_2_2] then
    local l_2_3 = string.sub
    local l_2_4 = l_2_2
    do
      local l_2_5 = -3
      do return l_2_3(l_2_4, l_2_5) end
      -- DECOMPILER ERROR at PC43: Confused about usage of register R4 for local variables in 'ReleaseLocals'

      if l_2_1[(string.sub)(l_2_2, -3)] then
        local l_2_6 = nil
        local l_2_7 = nil
        do
          local l_2_8 = nil
          do return (string.sub)(l_2_6, l_2_7) end
          -- DECOMPILER ERROR at PC58: Confused about usage of register R4 for local variables in 'ReleaseLocals'

          do return nil end
          -- DECOMPILER ERROR at PC61: Confused about usage of register R3 for local variables in 'ReleaseLocals'

        end
      end
    end
  end
end

if mp.HEADERPAGE_SZ < 128 or mp.FOOTERPAGE_SZ < 22 then
  return mp.CLEAN
end
if (mp.readu_u32)(headerpage, 1) ~= 67324752 then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilesize)()
if l_0_2 <= 208 then
  return mp.CLEAN
end
local l_0_3 = mp.FOOTERPAGE_SZ - 21
local l_0_4 = tostring(footerpage)
if (mp.readu_u32)(footerpage, l_0_3) ~= 101010256 then
  l_0_3 = l_0_4:find("PK\005\006", 1, true)
  if l_0_3 == nil then
    return mp.CLEAN
  end
  local l_0_5 = (mp.readu_u16)(footerpage, l_0_3 + 20)
  if l_0_5 > 0 then
    (mp.set_mpattribute)("Lua:ZipHasComment")
  end
end
do
  ;
  (mp.UfsSetMetadataBool)("Lua:FileInZip", true)
  local l_0_6 = (mp.readu_u16)(footerpage, l_0_3 + 10)
  local l_0_7 = (mp.readu_u32)(footerpage, l_0_3 + 12)
  if l_0_3 < l_0_7 then
    do
      if l_0_7 + (mp.FOOTERPAGE_SZ - l_0_3) + 1 <= 65536 or l_0_2 < 65536 then
        local l_0_8, l_0_9, l_0_10, l_0_11 = l_0_2
      end
      ;
      (mp.readprotection)(false)
      -- DECOMPILER ERROR at PC101: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC102: Confused about usage of register: R7 in 'UnsetPending'

      do
        local l_0_12 = nil
        ;
        (mp.readprotection)(true)
        if (mp.readfile)(l_0_2 - l_0_8, l_0_8) ~= nil then
          l_0_4 = (mp.readfile)(l_0_2 - l_0_8, l_0_8)
          l_0_3 = l_0_3 + l_0_12 - mp.FOOTERPAGE_SZ
        end
        local l_0_13 = 0
        local l_0_14 = 0
        local l_0_15, l_0_16 = nil, nil
        local l_0_17, l_0_18 = l_0_4:find("PK\001\002", 1, true)
        while 1 do
          if l_0_18 ~= nil and l_0_18 < l_0_3 and l_0_13 <= 500 then
            local l_0_19, l_0_20 = l_0_0(l_0_4, l_0_18)
            local l_0_21 = (mp.readu_u16)(l_0_4, l_0_18 + 27)
            local l_0_22 = (mp.readu_u16)(l_0_4, l_0_18 + 29)
            if l_0_20:sub(-1) == "/" then
              l_0_16 = l_0_20
            else
              l_0_13 = l_0_13 + 1
              l_0_15 = l_0_20
              local l_0_23 = l_0_1(l_0_20)
              if l_0_23 and l_0_23 ~= "" then
                l_0_14 = l_0_14 + 1
                ;
                (mp.set_mpattribute)("Lua:ZipHasFileWith!" .. l_0_23)
              end
            end
            do
              do
                l_0_18 = l_0_18 + l_0_19 + l_0_21 + l_0_22 + 46
                -- DECOMPILER ERROR at PC170: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC170: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC170: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
        local l_0_24 = {}
        -- DECOMPILER ERROR at PC179: No list found for R13 , SetList fails

        -- DECOMPILER ERROR at PC180: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC181: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC182: Overwrote pending register: R16 in 'AssignReg'

        for l_0_28 = 1, 5, 10 do
          -- DECOMPILER ERROR at PC184: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC192: Overwrote pending register: R19 in 'AssignReg'

          -- DECOMPILER ERROR at PC193: Overwrote pending register: R20 in 'AssignReg'

          if l_0_13 <= l_0_24[50] and l_0_28 == 2 then
            (mp.set_mpattribute)(100 .. l_0_24[500] .. ".A")
          else
            if l_0_13 <= l_0_24[l_0_28] and l_0_24[l_0_28 - 1] < l_0_13 then
              (mp.set_mpattribute)("LUA:ZipElementsGT" .. l_0_24[l_0_28 - 1] .. ".A")
              ;
              (mp.set_mpattribute)("LUA:ZipElementsLE" .. l_0_24[l_0_28] .. ".A")
            else
              if l_0_24[l_0_28] < l_0_13 and l_0_28 == #l_0_24 then
                (mp.set_mpattribute)("LUA:ZipElementsGT" .. l_0_24[l_0_28] .. ".A")
              end
            end
          end
        end
        if l_0_13 ~= 1 then
          return mp.CLEAN
        end
        if l_0_14 == 1 then
          (mp.set_mpattribute)("Lua:SingleSuspiciousExtensionInZip")
        end
        if l_0_6 == 1 then
          (mp.set_mpattribute)("Lua:SingleFileNoFoldersInZip")
        else
          if l_0_6 == 2 then
            (mp.set_mpattribute)("Lua:SingleFileInFoldersInZip")
            if l_0_15 ~= nil and l_0_16 ~= nil and l_0_16 == l_0_15:sub(0, l_0_16:len()) then
              (mp.set_mpattribute)("Lua:FolderNameSameAsFileName")
            end
          else
            ;
            (mp.set_mpattribute)("Lua:SingleFileInNestedFoldersInZip")
          end
        end
        if (versioning.GetTestMode)() ~= 401337 and (mp.readu_u32)(headerpage, 19) > 4194304 then
          return mp.CLEAN
        end
        local l_0_29 = (mp.readu_u16)(headerpage, 27)
        if (mp.readu_u32)(headerpage, 31 + l_0_29 - 4) == 1885960750 then
          (mp.set_mpattribute)("Lua:SingleZipInZip")
        end
        ;
        (mp.UfsSetMetadataBool)("Lua:SingleFileInZip", true)
        return mp.INFECTED
      end
    end
  end
end

