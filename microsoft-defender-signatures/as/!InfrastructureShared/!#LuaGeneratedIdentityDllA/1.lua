-- Threat: !InfrastructureShared
-- Name: !#Lua:GeneratedIdentityDll.A
-- Type: 10
-- Includes: ResearchData, BMLuaLib

if not mp.get_mpattribute("Lua:Context/FileExportCountGTE!10") then
  return mp.CLEAN
end
if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo()
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

local function l_0_4(l_1_0)
  l_1_0 = string.lower(l_1_0)
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
if string.find(l_0_5, l_0_6, 1, true) then
  return mp.CLEAN
end
if string.find(l_0_6, l_0_5, 1, true) then
  return mp.CLEAN
end
local l_0_7 = #l_0_5
if l_0_7 > #l_0_6 then
  l_0_7 = #l_0_6
end
local l_0_8 = 0
for l_0_9 = 1, l_0_7 do
  if string.sub(l_0_5, l_0_9, l_0_9) ~= string.sub(l_0_6, l_0_9, l_0_9) then
    break
  end
  l_0_8 = l_0_8 + 1
end
if 3 <= l_0_8 then
  return mp.CLEAN
end
local l_0_10 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]
if isnull(l_0_10) or l_0_10.RVA == 0 or l_0_10.Size == 0 then
  return mp.CLEAN
end
local l_0_11 = pe.foffset_rva(l_0_10.RVA)
if isnull(l_0_11) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_12 = mp.readfile(l_0_11, 40)
if isnull(l_0_12) or #l_0_12 < 40 then
  return mp.CLEAN
end
local l_0_13 = mp.readu_u32(l_0_12, 25)
local l_0_14 = mp.readu_u32(l_0_12, 33)
if isnull(l_0_13) or isnull(l_0_14) then
  return mp.CLEAN
end
if l_0_13 < 10 or 8192 < l_0_13 or l_0_14 == 0 then
  return mp.CLEAN
end
local l_0_15 = l_0_13
if 256 < l_0_15 then
  l_0_15 = 256
end
local l_0_16 = pe.mmap_rva(l_0_14, l_0_15 * 4)
if isnull(l_0_16) or #l_0_16 < l_0_15 * 4 then
  return mp.CLEAN
end

local function l_0_17(l_2_0)
  if #l_2_0 < 7 then
    return false
  end
  if string.find(l_2_0, "_", 1, true) then
    return false
  end
  local l_2_1 = 0
  local l_2_2 = 0
  local l_2_3 = 0
  local l_2_4 = 0
  local l_2_5 = 0
  local l_2_6
  for l_2_7 = 1, #l_2_0 do
    local l_2_8 = string.sub(l_2_0, l_2_7, l_2_7)
    local l_2_10 = "a" <= l_2_8 and l_2_8 <= "z"
    local l_2_12 = "A" <= l_2_8 and l_2_8 <= "Z"
    if l_2_10 or l_2_12 then
      l_2_1 = l_2_1 + 1
      if l_2_10 then
        l_2_4 = l_2_4 + 1
      else
        l_2_3 = l_2_3 + 1
      end
      local l_2_13 = string.lower(l_2_8)
      if l_2_13 == "a" or l_2_13 == "e" or l_2_13 == "i" or l_2_13 == "o" or l_2_13 == "u" then
        l_2_2 = l_2_2 + 1
      end
      if l_2_6 ~= nil and l_2_6 ~= l_2_10 then
        l_2_5 = l_2_5 + 1
      end
      l_2_6 = l_2_10
    end
  end
  if l_2_1 < 5 then
    return false
  end
  if l_2_3 == 0 or l_2_4 == 0 then
    return false
  end
  if l_2_2 * 100 >= l_2_1 * 22 then
    return false
  end
  if l_2_5 * 100 < (l_2_1 - 1) * 40 then
    return false
  end
  return true
end

local l_0_18 = 0
local l_0_19 = 0
for l_0_20 = 1, l_0_15 do
  local l_0_21 = mp.readu_u32(l_0_16, (l_0_20 - 1) * 4 + 1)
  if not isnull(l_0_21) and l_0_21 ~= 0 then
    local l_0_22 = pe.mmap_rva(l_0_21, 64)
    if not isnull(l_0_22) then
      local l_0_23 = string.find(l_0_22, "\000", 1, true)
      local l_0_24 = l_0_22
      if l_0_23 ~= nil then
        l_0_24 = string.sub(l_0_22, 1, l_0_23 - 1)
      end
      if 0 < #l_0_24 then
        l_0_18 = l_0_18 + 1
        if l_0_17(l_0_24) then
          l_0_19 = l_0_19 + 1
        end
      end
    end
  end
end
if l_0_18 < 10 then
  return mp.CLEAN
end
if l_0_19 < 5 then
  return mp.CLEAN
end
if l_0_18 > l_0_19 * 4 then
  return mp.CLEAN
end
set_research_data("genid_company", string.sub(l_0_1, 1, 48), false)
set_research_data("genid_internal", string.sub(l_0_5, 1, 48), false)
set_research_data("genid_original", string.sub(l_0_6, 1, 48), false)
set_research_data("genid_exports", tostring(l_0_19) .. "/" .. tostring(l_0_18), false)
return mp.INFECTED
