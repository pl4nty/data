-- Threat: !InfrastructureShared
-- Name: 1c8983bf8241
-- Type: 21

function is_leap_year(l_1_0)
  if l_1_0 / 4 * 4 == l_1_0 then
    return true
  end
  return false
end

function timestamp_to_date(l_2_0)
  local l_2_1 = 1970
  local l_2_2 = 86400
  local l_2_3 = 365 * l_2_2
  local l_2_4 = 0
  local l_2_5 = false
  while l_2_0 > l_2_4 do
    l_2_5 = is_leap_year(l_2_1)
    if l_2_5 then
      l_2_4 = l_2_4 + l_2_3 + l_2_2
    else
      l_2_4 = l_2_4 + l_2_3
    end
    l_2_1 = l_2_1 + 1
  end
  l_2_1 = l_2_1 - 1
  if l_2_5 then
    l_2_4 = l_2_4 - (l_2_3 + l_2_2)
  else
    l_2_4 = l_2_4 - l_2_3
  end
  l_2_0 = l_2_0 - l_2_4
  local l_2_6 = {
    30,
    59,
    90,
    120,
    151,
    181,
    212,
    243,
    273,
    304,
    334,
    365
  }
  local l_2_7 = {
    30,
    58,
    89,
    119,
    150,
    180,
    211,
    242,
    272,
    303,
    333,
    364
  }
  local l_2_8 = l_2_0 / l_2_2
  local l_2_9 = 1
  local l_2_10 = 1
  local l_2_11 = 0
  if l_2_5 then
    for l_2_12, l_2_13 in pairs(l_2_6) do
      if l_2_13 >= l_2_8 then
        l_2_9 = l_2_12
        l_2_10 = l_2_8 - l_2_11 + 1
        break
      end
      l_2_11 = l_2_13 + 1
    end
  else
    for l_2_14, l_2_15 in pairs(l_2_7) do
      if l_2_15 >= l_2_8 then
        l_2_9 = l_2_14
        l_2_10 = l_2_8 - l_2_11 + 1
        break
      end
      l_2_11 = l_2_15 + 1
    end
  end
  return l_2_1, l_2_9, l_2_10
end

local l_0_0 = mp.readu_u32(pe.mmap_va(mp.readu_u32(pe.mmap_va(pevars.sigaddr + 9, 4), 1), 4), 1)
local l_0_1 = pe.get_api_id(l_0_0)
if l_0_1 ~= 1269389306 then
  return mp.CLEAN
end
local l_0_2 = pehdr.TimeDateStamp
if l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5 = timestamp_to_date(l_0_2)
pe.mmap_patch_va(pevars.sigaddr + 17, "\184" .. string.char(l_0_4) .. "\000")
return mp.INFECTED
