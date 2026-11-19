-- Threat: \xac!GodLoader.BS
-- Type: 13
-- Includes: BMLuaLib, ResearchData
-- MpAttributes: (RPF:TopLevelFile) & (BM_PCK_FILE)

mp.readprotection(false)
local l_0_0, l_0_1 = pcall(mp.getfilesize)
if not l_0_0 or isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = 65536 < l_0_1 and 65536 or l_0_1
local l_0_2 = mp.readfile(0, l_0_1)
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = tostring(l_0_2)
mp.readprotection(true)
local l_0_4 = l_0_2:find("GDPC", 1, true) == 1 or l_0_2:find("GDPC", 5, true)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = {
  "add-mppreference",
  "runas"
}

local function l_0_6(l_1_0, l_1_1)
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    if l_1_0:find(l_1_3, 1, true) then
      return true
    end
  end
  return false
end

l_0_2 = string.lower(l_0_2)
if l_0_6(l_0_2, l_0_5) or l_0_2:find("res://control.gd", 1, true) and l_0_2:find("res://control.tscn.remap", 1, true) then
  set_research_data("[=>] GODOT_PCK_HEADER: ", tostring(l_0_5), false)
  return mp.INFECTED
end
return mp.CLEAN
