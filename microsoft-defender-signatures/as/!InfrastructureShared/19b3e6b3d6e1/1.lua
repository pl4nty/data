-- Threat: !InfrastructureShared
-- Name: 19b3e6b3d6e1
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = this_sigattrlog[1].utf8p2
local l_0_1 = split(l_0_0, " ")
local l_0_2 = {
  "telemetrydv1",
  "mdatp",
  "wdavdaemonunprivileged",
  "wdavdaemonenterprise",
  "dlpagent",
  "tccd"
}
local l_0_3 = #l_0_2
for l_0_4 = 1, #l_0_1 do
  local l_0_5 = tostring(l_0_1[l_0_4])
  local l_0_6 = l_0_5:gsub("%W", "")
  if 3 <= #l_0_6 then
    for l_0_7 = 1, l_0_3 do
      local l_0_8 = l_0_2[l_0_7]
      if string.find(l_0_8, l_0_6, 1, true) then
        TrackPidAndTechniqueBM("BM", "T1562.001", "DefenseEvasion-FriendlyPkill")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
