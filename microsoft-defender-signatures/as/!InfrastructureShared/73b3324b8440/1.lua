-- Threat: !InfrastructureShared
-- Name: 73b3324b8440
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p2
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = mp.GetExecutablesFromCommandLine(l_0_0)
if not l_0_0 then
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if l_0_2 and sysio.IsFileExists(l_0_2) and not mp.IsKnownFriendlyFile(l_0_2, false, false) then
    bm.add_related_file(l_0_2)
  end
end
return mp.INFECTED
