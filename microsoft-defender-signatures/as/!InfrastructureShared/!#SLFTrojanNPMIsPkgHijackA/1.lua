-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanNPMIsPkgHijackA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 1048576 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
do
  local l_0_1 = (mp.readfile)(0, l_0_0)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(tostring(l_0_1))
  if l_0_1 < 100 then
    return mp.CLEAN
  end
  if l_0_1 < 50 then
    return mp.CLEAN
  end
  if l_0_1 < 50 then
    return mp.CLEAN
  end
  if l_0_1 < 500 then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

