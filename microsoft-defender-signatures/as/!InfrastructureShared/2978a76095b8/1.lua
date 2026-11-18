-- Threat: !InfrastructureShared
-- Name: 2978a76095b8
-- Type: 21

if peattributes.is_delphi then
  return mp.CLEAN
end
if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
if pehdr.NumberOfSections < 5 or pehdr.NumberOfSections > 6 then
  return mp.CLEAN
end
if pesecs[1].Name ~= ".text" then
  return mp.CLEAN
end
if pesecs[3].Name ~= ".data" then
  return mp.CLEAN
end

function bytes_to_int(l_1_0, l_1_1, l_1_2, l_1_3)
  if not l_1_3 then
    error("need four bytes to convert to int", 2)
  end
  return l_1_0 + l_1_1 * 256 + l_1_2 * 65536 + l_1_3 * 16777216
end

function pointer2int(l_2_0, l_2_1)
  local l_2_2 = string.byte(l_2_0, l_2_1)
  local l_2_3 = string.byte(l_2_0, l_2_1 + 1)
  local l_2_4 = string.byte(l_2_0, l_2_1 + 2)
  local l_2_5 = string.byte(l_2_0, l_2_1 + 3)
  return (bytes_to_int(l_2_2, l_2_3, l_2_4, l_2_5))
end

if mp.getfilesize() > 512000 then
  return mp.CLEAN
end
local l_0_0 = 64
local l_0_1 = 0
local l_0_2 = 0
if hstrlog[1].matched then
  l_0_2 = hstrlog[1].VA
elseif hstrlog[2].matched then
  l_0_2 = hstrlog[2].VA
elseif hstrlog[3].matched then
  l_0_2 = hstrlog[3].VA
else
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = pe.mmap_va(l_0_2 - l_0_0, l_0_0)
for l_0_4 = 1, l_0_0 do
  local l_0_5 = string.byte(l_0_3, l_0_4)
  if l_0_5 == 128 then
    local l_0_6 = string.byte(l_0_3, l_0_4 + 1)
    if l_0_6 == 61 then
      local l_0_7 = string.byte(l_0_3, l_0_4 + 6)
      if l_0_7 == 77 then
        l_0_1 = pointer2int(l_0_3, l_0_4 + 2)
        break
      end
    end
  end
end
if l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_8 = 0
for l_0_9 = 1, l_0_0 do
  local l_0_10 = string.byte(l_0_3, l_0_9)
  if l_0_10 == 52 then
    local l_0_11 = string.byte(l_0_3, l_0_9 + 2)
    if l_0_11 == 44 then
      l_0_8 = string.byte(l_0_3, l_0_9 + 1)
      if l_0_8 ~= 0 then
        break
      end
    end
  end
  if l_0_10 == 128 then
    local l_0_12 = string.byte(l_0_3, l_0_9 + 3)
    if l_0_12 == 128 then
      l_0_8 = string.byte(l_0_3, l_0_9 + 2)
      if l_0_8 ~= 0 then
        break
      end
    end
  end
end
if l_0_8 == 0 then
  return mp.CLEAN
end
local l_0_13 = pe.mmap_va(l_0_1, 4)
local l_0_14 = string.byte(l_0_13, 1)
local l_0_15 = string.byte(l_0_13, 2)
local l_0_16 = string.byte(l_0_13, 3)
local l_0_17 = string.byte(l_0_13, 4)
local l_0_18 = mp.bitxor(l_0_14, l_0_8) - l_0_8
local l_0_19 = mp.bitxor(l_0_15, l_0_8) - l_0_8
local l_0_20 = mp.bitxor(l_0_16, l_0_8) - l_0_8
local l_0_21 = mp.bitxor(l_0_17, l_0_8) - l_0_8
if l_0_18 == 77 and l_0_19 == 90 and l_0_20 == 144 and l_0_21 == 0 then
  return mp.INFECTED
end
return mp.CLEAN
