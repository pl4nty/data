-- Threat: !InfrastructureShared
-- Name: 34b36c2d36aa
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if string.lower(string.sub(l_0_0, -12)) == "\\wsfadec.dll" then
    return mp.CLEAN
  end
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3 ~= nil and string.len(l_0_3) > 3 and sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
