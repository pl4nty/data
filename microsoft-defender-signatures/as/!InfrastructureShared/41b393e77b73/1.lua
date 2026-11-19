-- Threat: !InfrastructureShared
-- Name: 41b393e77b73
-- Type: 21
-- Includes: TechniqueTracker

bm.DisableSignature()
local l_0_0, l_0_1
local l_0_2 = false
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].ppid
  l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].ppid
  l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
l_0_0 = GetRealPidForScenario(l_0_0)
if l_0_1:find("powershell%.exe$") or l_0_1:find("cmd%.exe$") then
  local l_0_3, l_0_4 = bm.get_process_relationships()
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    if IsPidObservedGlobal(l_0_6.ppid) then
      local l_0_7 = GetTacticsTableForPid(l_0_6.ppid)
      local l_0_8 = GetTechniquesTableForPid(l_0_6.ppid)
      if l_0_7 ~= nil then
        for l_0_9, l_0_10 in pairs(l_0_7) do
          AddTacticForPid(l_0_0, l_0_9)
          l_0_2 = true
        end
      end
      if l_0_8 ~= nil then
        for l_0_11, l_0_12 in pairs(l_0_8) do
          AddTechniqueForPid(l_0_0, l_0_11)
          l_0_2 = true
        end
      end
      TrackPidAndTechniqueBM(l_0_6.ppid, "tt_to_child", "tt_to_child")
    end
  end
end
if l_0_2 then
  TrackPidAndTechniqueBM(l_0_0, "has_inherited_tt", "has_inherited_tt")
  return mp.INFECTED
end
return mp.CLEAN
