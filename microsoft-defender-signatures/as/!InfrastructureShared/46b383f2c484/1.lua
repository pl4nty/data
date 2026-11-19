-- Threat: !InfrastructureShared
-- Name: 46b383f2c484
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if (l_0_3:len() < 7 or string.lower(string.sub(l_0_3, -9)) ~= "mshta.exe" and string.lower(string.sub(l_0_3, -7)) ~= "cmd.exe") and sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
