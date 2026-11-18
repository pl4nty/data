-- Threat: !InfrastructureShared
-- Name: 17fb3887de09b
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = "rq_ServiceImagePaths"
local l_0_1 = 172800
local l_0_2 = 100
local l_0_3 = sysio.EnumerateServices()
for l_0_4, l_0_5 in pairs(l_0_3) do
  local l_0_6 = l_0_5.ServiceName
  if l_0_6 then
    local l_0_7 = string.lower(sysio.GetCommandLineFromService(l_0_6))
    l_0_7 = MpCommon.PathToWin32Path(l_0_7)
    if l_0_7 ~= nil and not IsKeyInRollingQueue(l_0_0, l_0_7, true) then
      local l_0_8 = StringSplit(l_0_7, " ")
      local l_0_9 = l_0_7:sub(1, 1)
      if l_0_9 ~= "\"" and l_0_9 ~= "'" and not StringEndsWith(l_0_8[1], ".exe") and not StringEndsWith(l_0_8[1], ".sys") then
        AppendToRollingQueue(l_0_0, l_0_8[1], l_0_1, l_0_2)
        return mp.CLEAN
      end
    end
  end
end
return mp.CLEAN
