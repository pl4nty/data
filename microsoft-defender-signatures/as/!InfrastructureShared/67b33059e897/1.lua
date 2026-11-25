-- Threat: !InfrastructureShared
-- Name: 67b33059e897
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  accdr = true,
  accde = true,
  mde = true
}
local l_0_2 = {
  "\\downloads\\",
  "\\appdata\\local\\temp\\",
  "\\inetcache\\",
  "\\content.outlook\\",
  "\\temporary internet files\\",
  "\\users\\public\\"
}

local function l_0_3(l_1_0)
  local l_1_1 = string.lower(l_1_0)
  for l_1_2 in string.gmatch(l_1_1, "\"([^\"]+)\"") do
    local l_1_3 = string.match(l_1_2, "%.(%a+)$")
    if l_1_3 ~= nil and l_0_1[l_1_3] then
      return l_1_2
    end
  end
  for l_1_4 in string.gmatch(l_1_1, "[^%s\"]+") do
    local l_1_5 = string.match(l_1_4, "%.(%a+)$")
    if l_1_5 ~= nil and l_0_1[l_1_5] then
      return l_1_4
    end
  end
  return nil
end

local function l_0_4(l_2_0)
  for l_2_1, l_2_2 in ipairs(l_0_2) do
    if string.find(l_2_0, l_2_2, 1, true) then
      return true
    end
  end
  return false
end

local l_0_5 = l_0_3(l_0_0)
if l_0_5 == nil then
  return mp.CLEAN
end
if not l_0_4(l_0_5) then
  return mp.CLEAN
end
bm.add_related_file(l_0_5)
TrackPidAndTechniqueBM("BM", "T1204.002", "AccessDb_CompiledFromDeliveryPath")
return mp.INFECTED
