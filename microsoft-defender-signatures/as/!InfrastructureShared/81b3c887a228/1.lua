-- Threat: !InfrastructureShared
-- Name: 81b3c887a228
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  local l_0_4 = l_0_3.image_path
  if l_0_4 ~= nil then
    l_0_4 = string.lower(l_0_4)
    if l_0_4:find("windows\\ccm\\", 1, true) then
      return mp.CLEAN
    end
    if l_0_4:find("tripwire.*\\twexec%.exe") then
      return mp.CLEAN
    end
    if l_0_4:find("ruby%.exe", 1, true) then
      return mp.CLEAN
    end
    if l_0_4:find("verodin_backend%.exe", 1, true) then
      return mp.CLEAN
    end
  end
  if l_0_3.ppid then
    TrackPidAndTechniqueBM(l_0_3.ppid, "T1003.005", "credentialdumping")
  end
end
return mp.INFECTED
