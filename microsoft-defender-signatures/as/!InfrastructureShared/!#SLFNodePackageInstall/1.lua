-- Threat: !InfrastructureShared
-- Name: !#SLF:NodePackageInstall
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpOnOpenRtpScan & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= "package.json" then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
local l_0_2 = {
  ["node.exe"] = true,
  ["npm.exe"] = true,
  ["pnpm.exe"] = true,
  ["yarn.exe"] = true,
  ["bun.exe"] = true
}
if not l_0_2[l_0_1] then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_3 == nil or l_0_3:find("\\node_modules\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_4 = "NodePackageInstallSeen"
if IsKeyInRollingQueue(l_0_4, l_0_3, true) then
  return mp.CLEAN
end
AppendToRollingQueue(l_0_4, l_0_3, "1", 28800, 50000, 1)
return mp.INFECTED
