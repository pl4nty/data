-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\12ad708be9a07\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = IsProcNameInParentProcessTree("cmdhstr", {"svchost.exe"})
do
  if l_0_0 and l_0_1 and l_0_2 then
    local l_0_5 = (mp.GetProcessCommandLine)(l_0_1)
    if l_0_5 == "" or l_0_5 == nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_2:lower(), "svchost.exe", 1, true) and (string.find)(l_0_5:lower(), "isoenvbroker", 1, true) then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end

