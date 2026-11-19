-- Threat: !InfrastructureShared
-- Name: 204b3be4f2777
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    local l_0_4
    if l_0_3:len() > 12 then
      l_0_4 = string.lower(string.sub(l_0_3, -12))
    end
    if l_0_4 ~= "rundll32.exe" and l_0_4 ~= "regsvr32.exe" and sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
