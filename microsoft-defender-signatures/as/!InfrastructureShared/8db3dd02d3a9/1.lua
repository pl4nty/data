-- Threat: !InfrastructureShared
-- Name: 8db3dd02d3a9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
end
local l_0_1 = MpCommon.GetPersistContextNoPath("ServiceCreationScript")
if l_0_1 then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
