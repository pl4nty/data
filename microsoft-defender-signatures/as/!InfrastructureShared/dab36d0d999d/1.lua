-- Threat: !InfrastructureShared
-- Name: dab36d0d999d
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 then
  local l_0_1 = string.match(l_0_0, "<Command>(.*)</Command>")
  local l_0_2 = string.match(l_0_0, "<Arguments>(.*)</Arguments>")
  if l_0_1 ~= nil then
    if l_0_2 ~= nil then
      l_0_1 = l_0_1 .. " " .. l_0_2
    end
    l_0_1 = l_0_1:lower()
    if l_0_1:find("\\ipy6?4?%.exe.-profile.?.?.py") then
      bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 6)
      TrackCommandLineAndTechnique(l_0_1, "T1053.005:schtask_target")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
