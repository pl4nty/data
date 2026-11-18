-- Threat: !InfrastructureShared
-- Name: 2db363010000
-- Type: 21

function add_related_file_wrapper(l_1_0)
  if l_1_0 ~= nil then
    local l_1_1 = mp.GetExecutablesFromCommandLine(l_1_0)
    
    for l_1_2, l_1_3 in ipairs(l_1_1) do
      l_1_3 = mp.ContextualExpandEnvironmentVariables(l_1_3)
      if string.find(l_1_3, "cmstp.exe$") == nil and sysio.IsFileExists(l_1_3) then
        bm.add_related_file(l_1_3)
      end
    end
  end
end

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  add_related_file_wrapper(this_sigattrlog[1].utf8p2)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  add_related_file_wrapper(this_sigattrlog[2].utf8p1)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  add_related_file_wrapper(this_sigattrlog[2].utf8p2)
end
return mp.INFECTED
