-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3bd7ff0db697\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 ~= nil then
    local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
    if not l_0_1 then
      return mp.CLEAN
    end
    l_0_1 = (string.lower)(l_0_1)
    l_0_1 = (string.gsub)(l_0_1, "%^", "")
    l_0_1 = (string.gsub)(l_0_1, ";", "")
    if (string.find)(l_0_1, "finger ", 1, true) and (string.find)(l_0_1, "delims=", 1, true) and (string.find)(l_0_1, "call ", 1, true) and (string.find)(l_0_1, "@", 1, true) then
      return mp.INFECTED
    end
    if (string.find)(l_0_1, "&& certutil -decode", 1, true) and (string.find)(l_0_1, "&& conhost.exe --headless", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

