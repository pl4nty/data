-- Threat: !InfrastructureShared
-- Name: ObfuscatedScriptHistogramInfra
-- Type: 1

function BuildTokenLengthHistogram()
  local l_1_0 = 0
  
  local l_1_1 = {}
  local l_1_2 = 128
  for l_1_3 = 0, mp.HEADERPAGE_SZ, l_1_2 do
    local l_1_4 = 0
    local l_1_5 = mp.HEADERPAGE_SZ - l_1_3
    if l_1_5 <= 0 then
      return {l_1_0, l_1_1}
    elseif l_1_2 > l_1_5 then
      l_1_4 = l_1_5
    else
      l_1_4 = l_1_2
    end
    local l_1_6 = mp.readheader(l_1_3, l_1_4)
    if l_1_6 == nil and l_1_6 == "" then
      break
    end
    local l_1_7 = tostring(l_1_6)
    if l_1_7 == nil and l_1_7 == "" then
      break
    end
    for l_1_8 in string.gmatch(l_1_7, "[^%!%+%0%,%;%(%)%[%]%:%.%=%'\"\\x]+") do
      l_1_0 = l_1_0 + 1
      local l_1_9 = l_1_1[string.len(l_1_8)]
      if l_1_9 == 0 or l_1_9 == nil then
        l_1_1[string.len(l_1_8)] = 1
      else
        l_1_1[string.len(l_1_8)] = l_1_9 + 1
      end
    end
  end
  return {l_1_0, l_1_1}
end

function BuildTokenCountHistogram()
  local l_2_0 = 0
  local l_2_1 = {}
  local l_2_2 = {
    ["!"] = 1,
    ["+"] = 2,
    ["0"] = 3,
    [","] = 4,
    [";"] = 5,
    ["("] = 6,
    [")"] = 7,
    ["["] = 8,
    ["]"] = 9,
    [":"] = 10,
    ["."] = 11,
    ["="] = 12,
    ["'"] = 13,
    ["\""] = 14,
    ["\\"] = 15,
    x = 16
  }
  local l_2_3 = 128
  for l_2_4 = 0, mp.HEADERPAGE_SZ, l_2_3 do
    local l_2_5 = 0
    local l_2_6 = mp.HEADERPAGE_SZ - l_2_4
    if l_2_6 <= 0 then
      return {l_2_0, l_2_1}
    elseif l_2_3 > l_2_6 then
      l_2_5 = l_2_6
    else
      l_2_5 = l_2_3
    end
    local l_2_7 = mp.readheader(l_2_4, l_2_5)
    if l_2_7 == nil and l_2_7 == "" then
      break
    end
    local l_2_8 = tostring(l_2_7)
    if l_2_8 == nil and l_2_8 == "" then
      break
    end
    for l_2_9 in string.gmatch(l_2_8, "[%!%+%0%,%;%(%)%[%]%:%.%=%'\"\\x]") do
      l_2_0 = l_2_0 + 1
      local l_2_10
      if l_2_2[l_2_9] == nil then
        l_2_10 = 0
      else
        l_2_10 = l_2_2[l_2_9]
      end
      local l_2_11 = l_2_1[l_2_10]
      if l_2_11 == 0 or l_2_11 == nil then
        l_2_1[l_2_10] = 1
      else
        l_2_1[l_2_10] = l_2_11 + 1
      end
    end
  end
  return {l_2_0, l_2_1}
end

function BuildRepeatedTokenHistogram()
  local l_3_0 = 0
  local l_3_1 = {}
  local l_3_2 = 128
  for l_3_3 = 0, mp.HEADERPAGE_SZ, l_3_2 do
    local l_3_4 = 0
    local l_3_5 = mp.HEADERPAGE_SZ - l_3_3
    if l_3_5 <= 0 then
      return {l_3_0, l_3_1}
    elseif l_3_2 > l_3_5 then
      l_3_4 = l_3_5
    else
      l_3_4 = l_3_2
    end
    local l_3_6 = mp.readheader(l_3_3, l_3_4)
    if l_3_6 == nil and l_3_6 == "" then
      break
    end
    local l_3_7 = tostring(l_3_6)
    if l_3_7 == nil and l_3_7 == "" then
      break
    end
    for l_3_8 in string.gmatch(l_3_7, "[%!%+%0%,%;%(%)%[%]%:%.%=%'\"\\x]+") do
      l_3_0 = l_3_0 + 1
      local l_3_9 = l_3_1[string.len(l_3_8)]
      if l_3_9 == 0 or l_3_9 == nil then
        l_3_1[string.len(l_3_8)] = 1
      else
        l_3_1[string.len(l_3_8)] = l_3_9 + 1
      end
    end
  end
  return {l_3_0, l_3_1}
end

function BuildHexadecimalHistogram()
  local l_4_0 = 0
  local l_4_1 = {}
  local l_4_2 = 128
  for l_4_3 = 0, mp.HEADERPAGE_SZ, l_4_2 do
    local l_4_4 = 0
    local l_4_5 = mp.HEADERPAGE_SZ - l_4_3
    if l_4_5 <= 0 then
      return {l_4_0, l_4_1}
    elseif l_4_2 > l_4_5 then
      l_4_4 = l_4_5
    else
      l_4_4 = l_4_2
    end
    local l_4_6 = mp.readheader(l_4_3, l_4_4)
    if l_4_6 == nil and l_4_6 == "" then
      break
    end
    local l_4_7 = tostring(l_4_6)
    if l_4_7 == nil and l_4_7 == "" then
      break
    end
    for l_4_8 in string.gmatch(l_4_7, "[0-9a-fA-F]+") do
      local l_4_9 = string.len(l_4_8)
      if 3 < l_4_9 then
        l_4_0 = l_4_0 + 1
        local l_4_10 = l_4_1[l_4_9]
        if l_4_10 == 0 or l_4_10 == nil then
          l_4_1[l_4_9] = 1
        else
          l_4_1[l_4_9] = l_4_10 + 1
        end
      end
    end
  end
  return {l_4_0, l_4_1}
end

function BuildAlphaNumericHistogram()
  local l_5_0 = 0
  local l_5_1 = {}
  local l_5_2 = 128
  for l_5_3 = 0, mp.HEADERPAGE_SZ, l_5_2 do
    local l_5_4 = 0
    local l_5_5 = mp.HEADERPAGE_SZ - l_5_3
    if l_5_5 <= 0 then
      return {l_5_0, l_5_1}
    elseif l_5_2 > l_5_5 then
      l_5_4 = l_5_5
    else
      l_5_4 = l_5_2
    end
    local l_5_6 = mp.readheader(l_5_3, l_5_4)
    if l_5_6 == nil and l_5_6 == "" then
      break
    end
    local l_5_7 = tostring(l_5_6)
    if l_5_7 == nil and l_5_7 == "" then
      break
    end
    for l_5_8 in string.gmatch(l_5_7, "[%d%w]+") do
      local l_5_9 = string.len(l_5_8)
      if 3 < l_5_9 then
        l_5_0 = l_5_0 + 1
        local l_5_10 = l_5_1[l_5_9]
        if l_5_10 == 0 or l_5_10 == nil then
          l_5_1[l_5_9] = 1
        else
          l_5_1[l_5_9] = l_5_10 + 1
        end
      end
    end
  end
  return {l_5_0, l_5_1}
end
