-- Threat: !InfrastructureShared
-- Name: ddb347777874
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = mp.CLEAN
l_0_0 = this_sigattrlog[2].utf8p2
l_0_1 = this_sigattrlog[3].utf8p1
if not l_0_0 or not l_0_1 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, ":\\windows\\servicing\\trustedinstaller.exe", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_1, "%windir%\\servicing\\trustedinstaller.exe", 1, true) then
  return mp.CLEAN
end
local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
if l_0_3 then
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if 3 <= string.len(l_0_5) then
      if l_0_2 ~= mp.INFECTED and string.find(l_0_1, l_0_5, 1, true) then
        l_0_2 = mp.INFECTED
      elseif sysio.IsFileExists(l_0_5) and not mp.IsKnownFriendlyFile(l_0_5, false, false) then
        bm.add_related_file(l_0_5)
      end
    end
  end
end
if l_0_0 ~= mp.INFECTED then
  return mp.CLEAN
end
return mp.INFECTED
