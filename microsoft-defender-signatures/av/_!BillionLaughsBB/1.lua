-- Threat: \xac!BillionLaughs.BB
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & SCPT:YML:BillionLaughs.BZ & (Lua:YAMLExt | Lua:YMLExt)

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 512000 < l_0_0 then
  l_0_0 = 512000
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = tostring(l_0_1)
local l_0_3 = string.lower(l_0_2)
local l_0_4 = 26

local function l_0_5(l_1_0)
  local l_1_1 = {}
  for l_1_2 in l_1_0:gmatch("[^\r\n]+") do
    local l_1_3 = l_1_2:match("&([%w_%-]+)")
    if l_1_3 then
      local l_1_4 = {}
      for l_1_5 in l_1_2:gmatch("%*([%w_%-]+)") do
        l_1_4[#l_1_4 + 1] = l_1_5
      end
      l_1_1[l_1_3] = l_1_4
    end
  end
  local l_1_6 = {}
  local l_1_7 = {}
  
  local function l_1_8(l_2_0, l_2_1)
    if l_2_1 >= l_0_4 then
      return nil, false
    end
    if l_1_6[l_2_0] ~= nil then
      return l_1_6[l_2_0], false
    end
    if l_1_7[l_2_0] then
      return nil, true
    end
    l_1_7[l_2_0] = true
    local l_2_2 = l_1_1[l_2_0]
    if l_2_2 == nil or #l_2_2 == 0 then
      l_1_7[l_2_0] = nil
      l_1_6[l_2_0] = 0
      return 0, false
    end
    local l_2_3 = 0
    for l_2_4, l_2_5 in ipairs(l_2_2) do
      if l_1_1[l_2_5] ~= nil then
        local l_2_6, l_2_7 = l_1_8(l_2_5, l_2_1 + 1)
        if l_2_7 then
          l_1_7[l_2_0] = nil
          return nil, true
        end
        if l_2_6 == nil then
          l_1_7[l_2_0] = nil
          return nil, false
        end
        if l_2_3 < l_2_6 then
          l_2_3 = l_2_6
        end
      end
    end
    l_1_7[l_2_0] = nil
    local l_2_8 = l_2_3 + 1
    l_1_6[l_2_0] = l_2_8
    return l_2_8, false
  end
  
  for l_1_9, l_1_10 in pairs(l_1_1) do
    local l_1_11, l_1_12 = l_1_8(l_1_9, 0)
    if l_1_12 or l_1_11 == nil or l_1_11 and l_1_11 >= l_0_4 then
      return true
    end
  end
  return false
end

local l_0_6 = l_0_5(l_0_3)
if l_0_6 then
  return mp.INFECTED
end
return mp.CLEAN
