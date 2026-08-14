-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaGeneratedIdentityDllA\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:Context/FileExportCountGTE!10") then
  return mp.CLEAN
end
if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = (pe.get_versioninfo)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.CompanyName
if isnull(l_0_1) or #l_0_1 < 3 then
  return mp.CLEAN
end
local l_0_2 = l_0_0.InternalName
local l_0_3 = l_0_0.OriginalFilename
if isnull(l_0_2) or isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = function(l_1_0)
  -- function num : 0_0
  l_1_0 = (string.lower)(l_1_0)
  local l_1_1 = l_1_0:match("^(.+)%.[^%.]+$")
  if l_1_1 ~= nil then
    return l_1_1
  end
  return l_1_0
end

local l_0_5 = l_0_4(l_0_2)
local l_0_6 = l_0_4(l_0_3)
if #l_0_5 < 3 or #l_0_6 < 3 then
  return mp.CLEAN
end
if l_0_5 == l_0_6 then
  return mp.CLEAN
end
if (string.find)(l_0_5, l_0_6, 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_6, l_0_5, 1, true) then
  return mp.CLEAN
end
do
  if #l_0_6 < #l_0_5 then
    local l_0_7, l_0_8 = #l_0_6
  end
  local l_0_9 = nil
  for l_0_13 = 1, l_0_9 do
    local l_0_10 = 0
    -- DECOMPILER ERROR at PC112: Confused about usage of register: R12 in 'UnsetPending'

    if (string.sub)(l_0_5, R12_PC112, R12_PC112) ~= (string.sub)(l_0_6, R12_PC112, R12_PC112) then
      break
    end
    l_0_10 = l_0_10 + 1
  end
  do
    -- DECOMPILER ERROR at PC126: Confused about usage of register: R8 in 'UnsetPending'

    if l_0_10 >= 3 then
      return mp.CLEAN
    end
    local l_0_14 = nil
    -- DECOMPILER ERROR at PC141: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC144: Confused about usage of register: R9 in 'UnsetPending'

    if isnull((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]) or ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).RVA == 0 or ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).Size == 0 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC152: Confused about usage of register: R9 in 'UnsetPending'

    local l_0_15 = nil
    if isnull((pe.foffset_rva)(((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).RVA)) then
      return mp.CLEAN
    end
    ;
    (mp.readprotection)(false)
    local l_0_16 = nil
    if isnull((mp.readfile)((pe.foffset_rva)(((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).RVA), 40)) or #(mp.readfile)((pe.foffset_rva)(((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).RVA), 40) < 40 then
      return mp.CLEAN
    end
    local l_0_17 = nil
    local l_0_18 = (mp.readu_u32)((mp.readfile)((pe.foffset_rva)(((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).RVA), 40), 25)
    if isnull(l_0_18) or isnull((mp.readu_u32)(l_0_17, 33)) then
      return mp.CLEAN
    end
    if l_0_18 < 10 or l_0_18 > 8192 or (mp.readu_u32)(l_0_17, 33) == 0 then
      return mp.CLEAN
    end
    do
      if l_0_18 > 256 then
        local l_0_19 = nil
      end
      -- DECOMPILER ERROR at PC220: Confused about usage of register: R13 in 'UnsetPending'

      local l_0_20 = nil
      -- DECOMPILER ERROR at PC229: Confused about usage of register: R14 in 'UnsetPending'

      if isnull((pe.mmap_rva)(l_0_19, 256 * 4)) or #(pe.mmap_rva)(l_0_19, 256 * 4) < 256 * 4 then
        return mp.CLEAN
      end
      local l_0_21 = nil
      local l_0_22 = nil
      local l_0_23 = function(l_2_0)
  -- function num : 0_1
  if #l_2_0 < 7 then
    return false
  end
  if (string.find)(l_2_0, "_", 1, true) then
    return false
  end
  local l_2_1 = 0
  local l_2_2 = 0
  local l_2_3 = 0
  local l_2_4 = 0
  local l_2_5 = 0
  do
    local l_2_6 = nil
    for l_2_10 = 1, #l_2_0 do
      local l_2_11 = (string.sub)(l_2_0, l_2_10, l_2_10)
      if l_2_11 >= "a" and l_2_11 <= "z" or l_2_11 >= "A" and l_2_11 <= "Z" then
        l_2_1 = l_2_1 + 1
        -- DECOMPILER ERROR at PC49: Confused about usage of register: R12 in 'UnsetPending'

        if l_2_11 >= "a" and l_2_11 <= "z" then
          l_2_4 = l_2_4 + 1
        else
          l_2_3 = l_2_3 + 1
        end
        local l_2_21 = nil
        if (string.lower)(l_2_11) == "a" or (string.lower)(l_2_11) == "e" or (string.lower)(l_2_11) == "i" or (string.lower)(l_2_11) == "o" or (string.lower)(l_2_11) == "u" then
          l_2_2 = l_2_2 + 1
        end
        if l_2_6 ~= nil and l_2_6 ~= l_2_21 then
          l_2_5 = l_2_5 + 1
        end
        l_2_6 = l_2_21
      end
    end
    if l_2_1 < 5 then
      return false
    end
    if l_2_3 == 0 or l_2_4 == 0 then
      return false
    end
    if (l_2_1) * 22 <= (l_2_2) * 100 then
      return false
    end
    if (l_2_5) * 100 < (l_2_1 - 1) * 40 then
      return false
    end
    do return true end
    -- DECOMPILER ERROR: 15 unprocessed JMP targets
  end
end

      for l_0_27 = 1, l_0_21 do
        local l_0_24, l_0_25 = 0, 0
        -- DECOMPILER ERROR at PC245: Confused about usage of register: R22 in 'UnsetPending'

        if not isnull((mp.readu_u32)(l_0_22, (R22_PC245 - 1) * 4 + 1)) and (mp.readu_u32)(l_0_22, (R22_PC245 - 1) * 4 + 1) ~= 0 and not isnull((pe.mmap_rva)((mp.readu_u32)(l_0_22, (R22_PC245 - 1) * 4 + 1), 64)) then
          local l_0_30 = nil
          local l_0_31 = nil
          -- DECOMPILER ERROR at PC282: Overwrote pending register: R26 in 'AssignReg'

          if (string.find)((pe.mmap_rva)((mp.readu_u32)(l_0_22, (R22_PC245 - 1) * 4 + 1), 64), "\000", 1, true) == nil or #(pe.mmap_rva)((mp.readu_u32)(l_0_22, (R22_PC245 - 1) * 4 + 1), 64) > 0 then
            l_0_24 = l_0_24 + 1
            -- DECOMPILER ERROR at PC288: Confused about usage of register: R26 in 'UnsetPending'

            if l_0_23((pe.mmap_rva)((mp.readu_u32)(l_0_22, (R22_PC245 - 1) * 4 + 1), 64)) then
              l_0_25 = l_0_25 + 1
            end
          end
        end
      end
      -- DECOMPILER ERROR at PC294: Confused about usage of register: R17 in 'UnsetPending'

      if l_0_24 < 10 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC299: Confused about usage of register: R18 in 'UnsetPending'

      if l_0_25 < 5 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC304: Confused about usage of register: R18 in 'UnsetPending'

      -- DECOMPILER ERROR at PC305: Confused about usage of register: R17 in 'UnsetPending'

      if l_0_25 * 4 < l_0_24 then
        return mp.CLEAN
      end
      set_research_data("genid_company", (string.sub)(l_0_1, 1, 48), false)
      set_research_data("genid_internal", (string.sub)(l_0_5, 1, 48), false)
      set_research_data("genid_original", (string.sub)(l_0_6, 1, 48), false)
      -- DECOMPILER ERROR at PC343: Confused about usage of register: R18 in 'UnsetPending'

      -- DECOMPILER ERROR at PC347: Confused about usage of register: R17 in 'UnsetPending'

      set_research_data("genid_exports", tostring(l_0_25) .. "/" .. tostring(l_0_24), false)
      return mp.INFECTED
    end
  end
end

