-- Threat: !InfrastructureShared
-- Name: 7fb35f7af531
-- Type: 21

function IsArrayMember(l_1_0, l_1_1)
  if l_1_1 == nil then
    return false
  end
  if #l_1_0 <= 0 then
    return false
  end
  for l_1_2 = 1, #l_1_0 do
    if l_1_0[l_1_2] == l_1_1 then
      return true
    end
  end
  return false
end

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2))
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2))
else
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2 = 0
local l_0_3 = 0
for l_0_4 in string.gmatch(l_0_0, "[^&]+") do
  l_0_2 = l_0_2 + 1
  table.insert(l_0_1, {})
  l_0_3 = 0
  for l_0_5 in string.gmatch(l_0_4, "%S+") do
    l_0_3 = l_0_3 + 1
    l_0_1[l_0_2][l_0_3] = string.lower(l_0_5)
  end
end
local l_0_6 = {}
local l_0_7 = 0
for l_0_8 = 1, #l_0_1 do
  local l_0_9 = 0
  for l_0_10 = 1, #l_0_1[l_0_8] do
    if l_0_7 == 0 then
      if l_0_9 == 0 and (string.sub(l_0_1[l_0_8][l_0_10], -9) == "bitsadmin" or string.sub(l_0_1[l_0_8][l_0_10], -13) == "bitsadmin.exe") then
        l_0_9 = 1000
      elseif l_0_9 == 1000 and l_0_1[l_0_8][l_0_10] == "/transfer" or l_0_9 == 1000 and l_0_1[l_0_8][l_0_10] == "/addfile" then
        l_0_9 = 2000
      elseif l_0_9 == 2000 and l_0_1[l_0_8][l_0_10] == "/upload" then
        l_0_9 = -1
        l_0_7 = -1
      elseif l_0_9 == 2000 and string.sub(l_0_1[l_0_8][l_0_10], 1, 4) == "http" then
        l_0_9 = 3000
      elseif l_0_9 == 3000 and string.match(l_0_1[l_0_8][l_0_10], "^%a:\\.+%.[^%.].+$") ~= nil then
        l_0_9 = 4000
        l_0_7 = 1
        l_0_6[#l_0_6 + 1] = l_0_1[l_0_8][l_0_10]
      end
    end
    if l_0_7 == 1 then
      if l_0_9 == 0 and l_0_10 == 1 and l_0_1[l_0_8][l_0_10] == "start" then
        l_0_9 = 1000
      elseif l_0_9 == 1000 and string.match(l_0_1[l_0_8][l_0_10], "^%a:\\.+%.[^%.].+$") ~= nil and IsArrayMember(l_0_6, l_0_1[l_0_8][l_0_10]) == true and string.sub(l_0_1[l_0_8][l_0_10], -4) == ".exe" or l_0_9 == 0 and l_0_10 == 1 and string.match(l_0_1[l_0_8][l_0_10], "^%a:\\.+%.[^%.].+$") ~= nil and IsArrayMember(l_0_6, l_0_1[l_0_8][l_0_10]) == true and string.sub(l_0_1[l_0_8][l_0_10], -4) == ".exe" then
        l_0_9 = 9999
        l_0_7 = 9999
      elseif l_0_9 == 0 and 1 < l_0_10 and string.match(l_0_1[l_0_8][l_0_10], "^%a:\\.+%.[^%.].+$") ~= nil and IsArrayMember(l_0_6, l_0_1[l_0_8][l_0_10]) == true then
        l_0_9 = 2000
      elseif l_0_9 == 2000 and 1 < l_0_10 and string.match(l_0_1[l_0_8][l_0_10], "^%a:\\.+%.[^%.].+$") ~= nil and IsArrayMember(l_0_6, l_0_1[l_0_8][l_0_10]) == false then
        l_0_9 = 3000
        l_0_6[#l_0_6 + 1] = l_0_1[l_0_8][l_0_10]
      end
    end
    if l_0_7 == 9999 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
