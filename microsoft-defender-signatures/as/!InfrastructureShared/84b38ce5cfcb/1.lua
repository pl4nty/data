-- Threat: !InfrastructureShared
-- Name: 84b38ce5cfcb
-- Type: 21
-- Includes: TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end

local function l_0_0(l_1_0)
  if not l_1_0.matched then
    return false
  end
  local l_1_1 = l_1_0.utf8p2
  if l_1_1 == nil then
    return false
  end
  l_1_1 = string.lower(l_1_1)
  if not string.find(l_1_1, " -command -", 1, true) then
    return false
  end
  if not string.find(l_1_1, "-nop", 1, true) and not string.find(l_1_1, "-noprofile", 1, true) then
    return false
  end
  if not string.find(l_1_1, "-noni", 1, true) and not string.find(l_1_1, "-noninteractive", 1, true) then
    return false
  end
  return true
end

local l_0_1 = l_0_0(this_sigattrlog[2]) or l_0_0(this_sigattrlog[3])
if not l_0_1 then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1059.001", "rundll32_ps_stdin")
return mp.INFECTED
