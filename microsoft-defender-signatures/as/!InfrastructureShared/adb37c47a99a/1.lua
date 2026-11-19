-- Threat: !InfrastructureShared
-- Name: adb37c47a99a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = this_sigattrlog[4]
if not (not isnull(l_0_0) and l_0_0.matched) or isnull(l_0_0.utf8p2) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
if type(l_0_1) ~= "string" or l_0_1 == "" then
  return mp.CLEAN
end

local function l_0_2(l_1_0, l_1_1)
  local l_1_2 = string.sub(l_1_0, l_1_1, l_1_1)
  local l_1_3 = string.sub(l_1_0, l_1_1 + 1, l_1_1 + 2)
  return not isnull(string.match(l_1_2, "^%a$")) and l_1_3 == ":\\" or string.sub(l_1_0, l_1_1, l_1_1 + 1) == "\\\\"
end

local function l_0_3(l_2_0)
  if string.sub(l_2_0, 1, 7) ~= "Config=" then
    return nil
  end
  local l_2_1 = ";Assembly="
  local l_2_2 = 8
  while l_2_2 <= #l_2_0 do
    local l_2_3, l_2_4 = string.find(l_2_0, l_2_1, l_2_2, true)
    if isnull(l_2_3) then
      return nil
    end
    local l_2_5 = l_2_4 + 1
    if 8 < l_2_3 and l_0_2(l_2_0, l_2_5) then
      return string.sub(l_2_0, l_2_5)
    end
    l_2_2 = l_2_4 + 1
  end
  return nil
end

local l_0_4 = l_0_3(l_0_1)
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5, l_0_6 = pcall(mp.IsKnownFriendlyFile, l_0_4, true, false)
if not l_0_5 or isnull(l_0_6) or l_0_6 then
  return mp.CLEAN
end
bm.add_threat_file(l_0_4)
TrackPidAndTechniqueBM("BM", "T1574.014", "AppDomainMgrUntrustedAssembly", 86400)
return mp.INFECTED
