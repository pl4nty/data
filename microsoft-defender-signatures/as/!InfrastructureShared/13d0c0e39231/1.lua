-- Threat: !InfrastructureShared
-- Name: 13d0c0e39231
-- Type: 21

if mp.readu_u32(headerpage, 1) ~= 28 or mp.readu_u16(headerpage, 5) ~= 2 then
  return mp.CLEAN
end
local l_0_0 = headerpage[29]
if l_0_0 ~= 3 and l_0_0 ~= 103 or headerpage[31] ~= 1 then
  return mp.CLEAN
end
local l_0_1 = 34
local l_0_2, l_0_3
local l_0_4 = 0
local l_0_5 = 0
while true do
  local l_0_6 = headerpage[l_0_1]
  l_0_2 = l_0_6 % 16
  l_0_3 = l_0_6 / 16
  l_0_1 = l_0_1 + 1
  if l_0_6 / 128 == 1 then
    if headerpage[l_0_1] == 128 and headerpage[l_0_1 + 1] == 128 then
      l_0_1 = l_0_1 + 6
    else
      l_0_1 = l_0_1 + 2
    end
  end
  if l_0_2 == 0 then
    if 1 <= l_0_5 and l_0_5 <= 5 and l_0_3 ~= 0 then
      mp.set_mpattribute("LUA:CVE-2017-11882_Condition2")
      return mp.CLEAN
    end
    if 0 < l_0_4 then
      l_0_4 = l_0_4 - 1
    else
      break
    end
  elseif l_0_2 == 1 then
    if l_0_3 % 2 == 0 then
      l_0_4 = l_0_4 + 1
    end
    if l_0_3 / 4 % 2 == 1 then
      l_0_1 = l_0_1 + 1
    end
    if l_0_3 / 2 % 2 == 1 then
      local l_0_7 = headerpage[l_0_1]
      l_0_1 = l_0_1 + 1 + l_0_7 * 3
    end
  elseif l_0_2 == 2 then
    l_0_1 = l_0_1 + 3
    if l_0_3 / 2 % 2 == 1 then
      l_0_4 = l_0_4 + 1
    end
  elseif l_0_2 == 3 then
    if headerpage[l_0_1] > 48 then
      mp.set_mpattribute("LUA:CVE-2017-11882_Condition2")
      return mp.CLEAN
    end
    l_0_1 = l_0_1 + 3
    l_0_4 = l_0_4 + 1
  elseif l_0_2 == 4 then
    l_0_4 = l_0_4 + 1
    l_0_1 = l_0_1 + 2
    if l_0_3 / 2 % 2 == 1 then
      local l_0_8 = headerpage[l_0_1]
      l_0_1 = l_0_1 + 1 + l_0_8 * 3
    end
  elseif l_0_2 == 5 then
    if headerpage[l_0_1 + 3] > 32 or headerpage[l_0_1 + 4] > 32 then
      mp.set_mpattribute("Lua:O97M/CVE-2017-0798.A!Matrix")
    end
    l_0_1 = l_0_1 + 7
  elseif l_0_2 == 6 then
    l_0_1 = l_0_1 + 1
  elseif l_0_2 == 7 then
    local l_0_9 = headerpage[l_0_1]
    l_0_1 = l_0_1 + 1 + l_0_9 * 3
  elseif l_0_2 == 8 then
    if headerpage[l_0_1] > 20 then
      mp.set_mpattribute("//Lua:O97M/CVE-2017-11882.A!FontRec")
      return mp.LOWFI
    end
    l_0_1 = l_0_1 + 2
    local l_0_10 = 0
    while true do
      if not (l_0_10 <= 32) or headerpage[l_0_1] == 0 then
        break
      end
      l_0_1 = l_0_1 + 1
      l_0_10 = l_0_10 + 1
    end
    if 32 < l_0_10 then
      return mp.LOWFI
    end
  elseif l_0_2 == 9 then
    if headerpage[l_0_1] == 100 then
      l_0_1 = l_0_1 + 4
    elseif headerpage[l_0_1] == 101 then
      l_0_1 = l_0_1 + 3
    else
      l_0_1 = l_0_1 + 2
    end
  elseif 14 < l_0_2 then
    break
  end
  l_0_5 = l_0_2
end
return mp.CLEAN
