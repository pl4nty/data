-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\86bb32ff0539d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
for l_0_4 = l_0_0, 1, -1 do
  if (sigattr_tail[l_0_4]).attribute == 16491 and (sigattr_tail[l_0_4]).utf8p1 == "GenericRansomware:Type4" then
    (bm.set_detection_string)((sigattr_tail[l_0_4]).utf8p2)
    addDisruptionInfo(true)
    return mp.INFECTED
  end
end
return mp.CLEAN

