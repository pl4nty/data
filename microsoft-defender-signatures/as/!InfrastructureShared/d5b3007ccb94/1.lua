-- Threat: !InfrastructureShared
-- Name: d5b3007ccb94
-- Type: 21

if mp.get_sigattr_event_count(16384) > 50 then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) == true then
      if string.find(string.lower(l_0_3), "getupdatedates", 1, true) then
        return mp.CLEAN
      end
      local l_0_4 = {
        [".exe"] = true
      }
      local l_0_5 = string.sub(l_0_3, -4)
      if l_0_5 ~= nil and l_0_4[l_0_5] ~= true then
        bm.add_related_file(l_0_3)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
