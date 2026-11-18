-- Threat: !InfrastructureShared
-- Name: 105b36f5750d4
-- Type: 21

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
local l_0_1
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[7].utf8p1)
end
if l_0_1 == nil or #l_0_1 < 48 then
  return mp.CLEAN
end
if string.find(l_0_1, "\\\\admin$\\\\", 1, true) or string.find(l_0_1, "\\[a-z]%$\\") then
  local l_0_2 = string.lower(MpCommon.PathToWin32Path(l_0_1))
  if l_0_2 ~= nil and string.sub(l_0_2, 0, 2) == "\\\\" and l_0_0 ~= nil then
    if string.find(string.lower(l_0_0), "\\munich re group\\", 1, true) then
      return mp.CLEAN
    end
    local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
      if sysio.IsFileExists(l_0_5) == true then
        if string.find(string.lower(l_0_5), "getupdatedates", 1, true) then
          return mp.CLEAN
        end
        local l_0_6 = {
          [".exe"] = true
        }
        local l_0_7 = string.sub(l_0_5, -4)
        if l_0_7 ~= nil and l_0_6[l_0_7] ~= true then
          bm.add_related_file(l_0_5)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
