-- Threat: !InfrastructureShared
-- Name: 6778d1d17119
-- Type: 21

if not (pesecs and pe and pehdr and pehdr.DataDirectory and peattributes) or not peattributes.isexe then
  return mp.CLEAN
end
local l_0_0 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY]
local l_0_1 = pehdr.FileAlignment
if not (l_0_0 and l_0_1) or not (0 < l_0_1) then
  return mp.CLEAN
end
local l_0_2 = pehdr.NumberOfSections
local l_0_3 = pesecs[l_0_2]
local l_0_4 = l_0_3.Name
local l_0_5
if l_0_4 == ".reloc" then
  l_0_5 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_BASERELOC]
elseif l_0_4 == ".rsrc" then
  if not mp.get_mpattribute("pea_executes_from_last_section") then
    return mp.CLEAN
  end
  l_0_5 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]
else
  return mp.CLEAN
end
if not l_0_5 then
  return mp.CLEAN
end
if not mp.get_mpattribute("pea_lastscn_vfalign") or (not mp.get_mpattribute("pea_lastscn_writable") or not mp.get_mpattribute("pea_lastscn_executable")) and (not mp.get_mpattribute("Lua:TopLevelUnsigned") or l_0_0.RVA == 0) then
  return mp.CLEAN
end
local l_0_6 = mp.getfilesize()
if not l_0_6 or not (0 < l_0_6) then
  return mp.CLEAN
end
local l_0_7 = l_0_3.PointerToRawData + l_0_3.SizeOfRawData
local l_0_8 = l_0_0.RVA
local l_0_9 = l_0_0.Size
if not (l_0_8 and l_0_9) or not (l_0_6 >= l_0_8) then
  return mp.CLEAN
end
local l_0_10 = l_0_3.PointerToRawData
if not l_0_10 or not (0 < l_0_10) then
  return mp.CLEAN
end
local l_0_11 = l_0_5.Size + (l_0_1 - l_0_5.Size % l_0_1) % l_0_1
local l_0_12 = l_0_10 + l_0_11
if l_0_6 < l_0_7 or l_0_6 > l_0_7 and 100 < l_0_6 - l_0_7 or l_0_6 > l_0_12 and l_0_6 - l_0_12 < 4096 or l_0_7 < l_0_12 then
  return mp.CLEAN
end

local function l_0_13(l_1_0, l_1_1)
  mp.readprotection(false)
  local l_1_2 = mp.readfile(l_1_0, l_1_1)
  mp.readprotection(true)
  return l_1_2
end

local function l_0_14(l_2_0)
  if not l_2_0 or #l_2_0 ~= 128 then
    return false
  end
  local l_2_1 = 0
  local l_2_2 = 0
  for l_2_3 = 1, 128 do
    if l_2_0:byte(l_2_3) == 0 then
      l_2_1 = l_2_1 + 1
      l_2_2 = l_2_2 + 1
      if 3 <= l_2_2 then
        return true
      end
      if 6 <= l_2_1 then
        return true
      end
    else
      l_2_2 = 0
    end
  end
  return false
end

local l_0_15 = string.rep("\000", 384)

local function l_0_16(l_3_0)
  local l_3_1 = l_0_13(l_3_0, 512)
  if not l_3_1 or #l_3_1 ~= 512 then
    return false
  end
  local l_3_2 = l_3_1:sub(1, 128)
  if l_0_14(l_3_2) then
    return false
  end
  local l_3_3 = l_3_1:sub(129, 512)
  if not l_3_3 or #l_3_3 ~= 384 or l_3_3 ~= l_0_15 then
    return false
  end
  if 1024 <= l_0_1 then
    local l_3_4 = l_0_13(l_3_0 + l_0_1 - 384, 384)
    if not l_3_4 or l_3_4 ~= l_0_15 then
      return false
    end
  end
  local l_3_5 = l_0_13(l_3_0 + l_0_1, 128)
  if not l_3_5 or l_0_14(l_3_5) then
    return false
  end
  return true
end

if 0 < l_0_12 and l_0_16(l_0_12) then
  mp.set_mpattribute("LUA:Virus:Win32/Expiro.HAB4!MTB")
  return mp.INFECTED
end
if l_0_8 ~= 0 and l_0_8 > l_0_3.PointerToRawData and l_0_7 > l_0_8 then
  local l_0_17 = l_0_13(l_0_8, 4)
  if not l_0_17 then
    return mp.CLEAN
  end
  local l_0_18 = mp.readu_u32(l_0_17, 1)
  if l_0_18 and l_0_18 ~= l_0_9 and l_0_16(l_0_8) then
    mp.set_mpattribute("LUA:Virus:Win32/Expiro.HAB4!MTB")
    return mp.INFECTED
  end
end
return mp.CLEAN
