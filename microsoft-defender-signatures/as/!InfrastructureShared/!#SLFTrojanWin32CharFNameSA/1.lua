-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/CharFName.SA
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (RPF:AnyFileHasIOAVURL | Lua:HasMotw)

local function l_0_0(l_1_0, l_1_1)
  local l_1_2 = l_1_0:byte(l_1_1)
  
  if not l_1_2 then
    return nil
  end
  if l_1_2 < 128 then
    return l_1_2, l_1_1 + 1
  end
  local l_1_3 = 0
  local l_1_4 = 0
  if 194 <= l_1_2 and l_1_2 <= 223 then
    l_1_3 = 2
    l_1_4 = 128
  elseif 224 <= l_1_2 and l_1_2 <= 239 then
    l_1_3 = 3
    l_1_4 = 2048
  elseif 240 <= l_1_2 and l_1_2 <= 244 then
    l_1_3 = 4
    l_1_4 = 65536
  else
    return nil
  end
  local l_1_5 = l_1_2 % 2 ^ (8 - l_1_3)
  for l_1_6 = 2, l_1_3 do
    local l_1_7 = l_1_0:byte(l_1_1 + l_1_6 - 1)
    if not l_1_7 or l_1_7 < 128 or 191 < l_1_7 then
      return nil
    end
    l_1_5 = l_1_5 * 64 + l_1_7 % 64
  end
  if l_1_4 > l_1_5 then
    return nil
  end
  return l_1_5, l_1_1 + l_1_3
end

local function l_0_1(l_2_0)
  local l_2_1 = 1
  local l_2_2 = 0
  while l_2_1 <= #l_2_0 do
    local l_2_3, l_2_4 = l_0_0(l_2_0, l_2_1)
    if not l_2_3 then
      break
    end
    if 119808 <= l_2_3 and l_2_3 <= 120831 then
      l_2_2 = l_2_2 + 1
      if 2 <= l_2_2 then
        return true
      end
    end
    l_2_1 = l_2_4
  end
  return false
end

local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_FNAME)
if not l_0_2 then
  return mp.CLEAN
end
if not l_0_2:match("[\128-\255]") then
  return mp.CLEAN
end
if l_0_1(l_0_2) == true then
  return mp.INFECTED
end
return mp.CLEAN
