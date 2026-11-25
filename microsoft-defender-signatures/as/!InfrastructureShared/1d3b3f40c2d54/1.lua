-- Threat: !InfrastructureShared
-- Name: 1d3b3f40c2d54
-- Type: 21
-- Includes: TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  accdr = true,
  accde = true,
  accdb = true,
  mde = true,
  mdb = true
}
local l_0_2 = {
  accdr = true,
  accde = true,
  mde = true
}
local l_0_3 = {
  "\\downloads\\",
  "\\appdata\\local\\temp\\",
  "\\inetcache\\",
  "\\content.outlook\\",
  "\\temporary internet files\\",
  "\\users\\public\\"
}

local function l_0_4(l_1_0)
  local l_1_1 = string.lower(l_1_0)
  for l_1_2 in string.gmatch(l_1_1, "\"([^\"]+)\"") do
    local l_1_3 = string.match(l_1_2, "%.(%a+)$")
    if l_1_3 ~= nil and l_0_1[l_1_3] then
      return l_1_2, l_1_3
    end
  end
  for l_1_4 in string.gmatch(l_1_1, "[^%s\"]+") do
    local l_1_5 = string.match(l_1_4, "%.(%a+)$")
    if l_1_5 ~= nil and l_0_1[l_1_5] then
      return l_1_4, l_1_5
    end
  end
  return nil, nil
end

local function l_0_5(l_2_0)
  for l_2_1, l_2_2 in ipairs(l_0_3) do
    if string.find(l_2_0, l_2_2, 1, true) then
      return true
    end
  end
  return false
end

local l_0_6, l_0_7 = l_0_4(l_0_0)
if l_0_6 == nil then
  return mp.CLEAN
end
if not l_0_2[l_0_7] and not l_0_5(l_0_6) then
  return mp.CLEAN
end
bm.add_related_file(l_0_6)
TrackPidAndTechniqueBM("BM", "T1059", "AccessDb_ChildProcess")
return mp.INFECTED
