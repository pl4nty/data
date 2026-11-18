-- Threat: !InfrastructureShared
-- Name: 86b3e0552647
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0)
  if l_0_1:find("reg%.?e?x?e?%s+delete%s") or l_0_1:find("reg%.?e?x?e?%s+add%s") then
    return mp.CLEAN
  end
  if l_0_1:find("powershell%.exe.*%sset-") or l_0_1:find("passwordexpirywarning", 1, true) then
    return mp.CLEAN
  end
end
local l_0_2, l_0_3 = bm.get_process_relationships()
for l_0_4, l_0_5 in ipairs(l_0_2) do
  local l_0_6 = l_0_5.image_path
  if l_0_6 ~= nil then
    l_0_6 = string.lower(l_0_6)
    if l_0_6:find("windows\\ccm\\", 1, true) then
      return mp.CLEAN
    end
    if l_0_6:find("tripwire.*\\twexec%.exe") then
      return mp.CLEAN
    end
    if l_0_6:find("ruby%.exe", 1, true) then
      return mp.CLEAN
    end
    if l_0_6:find("verodin_backend%.exe", 1, true) then
      return mp.CLEAN
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1003.005", "creddiscovery")
return mp.INFECTED
