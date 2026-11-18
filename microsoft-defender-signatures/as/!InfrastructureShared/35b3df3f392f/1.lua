-- Threat: !InfrastructureShared
-- Name: 35b3df3f392f
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
