-- Threat: !InfrastructureShared
-- Name: 1c7781b1fd907
-- Type: 21

if peattributes and peattributes.is_process then
  return mp.CLEAN
end
if not (pesecs and pe and pehdr and pehdr.DataDirectory and peattributes) or not peattributes.isexe then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:TopLevelUnsigned") then
  return mp.CLEAN
end
if not pe.IMAGE_DIRECTORY_ENTRY_SECURITY or pe.IMAGE_DIRECTORY_ENTRY_SECURITY < 0 then
  return mp.CLEAN
end
if not pe.IMAGE_DIRECTORY_ENTRY_BASERELOC or 0 > pe.IMAGE_DIRECTORY_ENTRY_BASERELOC then
  return mp.CLEAN
end
if not pe.IMAGE_DIRECTORY_ENTRY_RESOURCE or 0 > pe.IMAGE_DIRECTORY_ENTRY_RESOURCE then
  return mp.CLEAN
end
local l_0_0 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY]
local l_0_1 = pehdr.FileAlignment
if not (l_0_0 and l_0_1) or not (0 < l_0_1) then
  return mp.CLEAN
end
local l_0_2 = pehdr.NumberOfSections
if not l_0_2 or l_0_2 <= 0 then
  return mp.CLEAN
end
local l_0_3 = pesecs[l_0_2]
local l_0_4 = l_0_3
if not l_0_4 then
  return mp.CLEAN
end
if not (l_0_4.PointerToRawData and l_0_4.SizeOfRawData and l_0_4.VirtualAddress) or 0 > l_0_4.PointerToRawData or 0 > l_0_4.SizeOfRawData then
  return mp.CLEAN
end
local l_0_5 = l_0_4.Name
local l_0_6
local l_0_7 = l_0_0.RVA
local l_0_8 = l_0_0.Size
if not l_0_7 or not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = l_0_3.PointerToRawData + l_0_3.SizeOfRawData
local l_0_10 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_BASERELOC]
local l_0_11 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]
local l_0_12 = {Size = 0, RVA = 0}
if not l_0_10 or not l_0_11 then
  return mp.CLEAN
end
local l_0_13 = mp.get_mpattribute("pea_executes_from_last_section")
local l_0_14 = mp.get_mpattribute("pea_lastscn_executable")
local l_0_15 = mp.get_mpattribute("pea_lastscn_writable")
if l_0_5 == ".reloc" or l_0_4.VirtualAddress ~= 0 and l_0_4.VirtualAddress == l_0_10.RVA then
  l_0_6 = l_0_10
elseif (l_0_5 == ".rsrc" or l_0_4.VirtualAddress ~= 0 and l_0_4.VirtualAddress == l_0_11.RVA) and l_0_13 and l_0_14 and l_0_15 then
  l_0_6 = l_0_11
elseif 0 < l_0_8 and l_0_7 > l_0_4.PointerToRawData and l_0_7 < l_0_9 - 8192 then
  l_0_6 = l_0_0
elseif 2 < l_0_2 and l_0_14 and l_0_15 then
  local l_0_16 = pesecs[l_0_2 - 1]
  if l_0_16 ~= nil and l_0_16.PointerToRawData and l_0_16.SizeOfRawData and l_0_16.VirtualAddress then
    if l_0_16.Name == ".rsrc" and l_0_16.VirtualAddress ~= 0 and l_0_16.VirtualAddress == l_0_11.RVA and l_0_13 then
      l_0_6 = l_0_11
      l_0_4 = l_0_16
    elseif l_0_16.VirtualAddress ~= 0 and l_0_16.VirtualAddress == l_0_10.RVA then
      l_0_6 = l_0_10
      l_0_4 = l_0_16
    elseif pesecs[l_0_2].Name == "UPX1" and pesecs[1].Name == ".text" and l_0_13 then
      l_0_12.Size = 1
      l_0_6 = l_0_12
    else
      return mp.CLEAN
    end
  else
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
if not (l_0_6 and l_0_6.Size) or 0 >= l_0_6.Size then
  return mp.CLEAN
end
local l_0_17 = mp.getfilesize()
if not l_0_17 or not (0 < l_0_17) then
  return mp.CLEAN
end
if l_0_9 <= 0 or l_0_9 > l_0_17 then
  return mp.CLEAN
end
if l_0_7 < 0 or l_0_8 < 0 or l_0_7 > l_0_17 or l_0_8 > l_0_17 - l_0_7 then
  return mp.CLEAN
end
local l_0_18 = l_0_4.PointerToRawData
if not l_0_18 or not (0 < l_0_18) then
  return mp.CLEAN
end
local l_0_19 = l_0_6.Size + (l_0_1 - l_0_6.Size % l_0_1) % l_0_1
local l_0_20 = l_0_18 + l_0_19
if l_0_19 <= 0 or l_0_18 > l_0_20 or l_0_9 < l_0_20 then
  return mp.CLEAN
end
if l_0_9 < l_0_17 and 100 < l_0_17 - l_0_9 or l_0_17 >= l_0_20 and l_0_17 - l_0_20 < 4096 then
  return mp.CLEAN
end

local function l_0_21(l_1_0, l_1_1)
  if not (l_1_0 and l_1_1) or l_1_0 < 0 or l_1_1 <= 0 or l_1_0 > l_0_17 or l_1_1 > l_0_17 - l_1_0 then
    return nil
  end
  mp.readprotection(false)
  local l_1_2 = mp.readfile(l_1_0, l_1_1)
  mp.readprotection(true)
  return l_1_2
end

local function l_0_22(l_2_0)
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

local l_0_23 = string.rep("\000", 384)

local function l_0_24(l_3_0)
  local l_3_1 = l_0_21(l_3_0, 512)
  if not l_3_1 or #l_3_1 ~= 512 then
    return false
  end
  local l_3_2 = l_3_1:sub(1, 128)
  if l_0_22(l_3_2) then
    l_3_1 = l_0_21(l_3_0 + l_0_1, 512)
    if not l_3_1 or #l_3_1 ~= 512 then
      return false
    end
    l_3_2 = l_3_1:sub(1, 128)
    if l_0_22(l_3_2) then
      return false
    end
  end
  local l_3_3 = l_3_1:sub(129, 512)
  if not l_3_3 or #l_3_3 ~= 384 or l_3_3 ~= l_0_23 then
    return false
  end
  if 1024 <= l_0_1 then
    local l_3_4 = l_0_21(l_3_0 + l_0_1 - 384, 384)
    if not l_3_4 or l_3_4 ~= l_0_23 then
      return false
    end
  end
  local l_3_5 = l_0_21(l_3_0 + l_0_1, 128)
  if not l_3_5 or l_0_22(l_3_5) then
    return false
  end
  return true
end

if l_0_24(l_0_20) then
  mp.set_mpattribute("LUA:Virus:Win32/Expiro.HAB6!MTB")
  return mp.INFECTED
end
if l_0_7 ~= 0 and 0 < l_0_8 and l_0_7 > l_0_3.PointerToRawData and l_0_7 < l_0_9 then
  local l_0_25 = l_0_21(l_0_7, 4)
  if not l_0_25 or #l_0_25 ~= 4 then
    return mp.CLEAN
  end
  local l_0_26 = mp.readu_u32(l_0_25, 1)
  if l_0_26 and l_0_26 ~= l_0_8 and l_0_24(l_0_7) then
    mp.set_mpattribute("LUA:Virus:Win32/Expiro.HAB6!MTB")
    return mp.INFECTED
  end
end
return mp.CLEAN
