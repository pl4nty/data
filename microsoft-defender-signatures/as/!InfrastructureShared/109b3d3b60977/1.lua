-- Threat: !InfrastructureShared
-- Name: 109b3d3b60977
-- Type: 21
-- Includes: TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
local l_0_0 = "SpawnTo"
if this_sigattrlog[2].matched then
  l_0_0 = "RemoteThread"
end
local l_0_1 = {
  accdr = true,
  accde = true,
  accdb = true,
  mde = true,
  mdb = true
}

local function l_0_2(l_1_0)
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

local l_0_3 = this_sigattrlog[1].utf8p2
if l_0_3 ~= nil then
  local l_0_4 = l_0_2(l_0_3)
  if l_0_4 ~= nil then
    bm.add_related_file(l_0_4)
  end
end
TrackPidAndTechniqueBM("BM", "T1055", "AccessDb_" .. l_0_0)
return mp.INFECTED
