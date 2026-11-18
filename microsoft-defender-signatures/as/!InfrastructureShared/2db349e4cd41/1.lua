-- Threat: !InfrastructureShared
-- Name: 2db349e4cd41
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
local l_0_1 = {
  "http",
  "://(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)",
  "-q-i"
}
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil and not StringEndsWith(l_0_0, ".msi\"") and not StringEndsWith(l_0_0, ".msi\" ") then
  for l_0_2 = 1, #l_0_1 do
    if string.find(l_0_0, l_0_1[l_0_2], 1, true) or string.match(l_0_0, l_0_1[l_0_2]) then
      local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0)
      for l_0_4, l_0_5 in ipairs(l_0_3) do
        l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
        if sysio.IsFileExists(l_0_5) and string.lower(l_0_5):match("(%w+%.exe)$") ~= nil then
          bm.add_related_file(l_0_5)
        end
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
