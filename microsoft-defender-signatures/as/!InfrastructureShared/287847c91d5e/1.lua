-- Threat: !InfrastructureShared
-- Name: 287847c91d5e
-- Type: 21

function count_substring(l_1_0, l_1_1)
  local l_1_2 = 0
  
  local l_1_3 = 1
  while true do
    local l_1_4, l_1_5 = string.find(l_1_0, l_1_1, l_1_3, true)
    if not l_1_4 then
      break
    end
    l_1_2 = l_1_2 + 1
    l_1_3 = l_1_5 + 1
  end
  return l_1_2
end

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if count_substring(l_0_1, "->") ~= 1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.find(l_0_1, "->", 1, true)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.sub(l_0_1, l_0_3 + 1)
if l_0_4 == "" then
  return mp.CLEAN
end
if 1 < count_substring(l_0_4, "/") + count_substring(l_0_4, "\\") then
  return mp.CLEAN
end
if string.find(l_0_4, "-install.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
