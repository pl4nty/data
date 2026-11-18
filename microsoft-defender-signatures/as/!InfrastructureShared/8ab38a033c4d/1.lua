-- Threat: !InfrastructureShared
-- Name: 8ab38a033c4d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_1 = this_sigattrlog[1].ppid
end
if l_0_0 ~= nil then
  local l_0_2 = string.lower(l_0_0)
  if l_0_2:find("reg%.?e?x?e?%p?%s+delete%s") or l_0_2:find("reg%.?e?x?e?%p?%s+add%s") then
    return mp.CLEAN
  end
  if l_0_2:find("powershell%.exe.*%sset-") or l_0_2:find("passwordexpirywarning", 1, true) then
    return mp.CLEAN
  end
end
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_3) do
  local l_0_7 = l_0_6.image_path
  if l_0_7 ~= nil then
    l_0_7 = string.lower(l_0_7)
    if l_0_7:find("windows\\ccm\\", 1, true) then
      return mp.CLEAN
    end
    if l_0_7:find("tripwire.*\\twexec%.exe") then
      return mp.CLEAN
    end
    if l_0_7:find("ruby%.exe", 1, true) then
      return mp.CLEAN
    end
    if l_0_7:find("verodin_backend%.exe", 1, true) then
      return mp.CLEAN
    end
  end
end
if IsDetectionThresholdMet(l_0_1) then
  TrackPidAndTechniqueBM(l_0_1, "T1003.005", "credentialdumping")
  return mp.INFECTED
end
return mp.CLEAN
