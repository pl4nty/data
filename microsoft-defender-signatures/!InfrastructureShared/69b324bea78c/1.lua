-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69b324bea78c\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[2]).matched then
  local l_0_0 = (this_sigattrlog[1]).timestamp
  local l_0_1 = (this_sigattrlog[2]).timestamp
  local l_0_2 = nil
  if l_0_1 < l_0_0 then
    l_0_2 = l_0_0 - l_0_1
  else
    l_0_2 = l_0_1 - l_0_0
  end
  if l_0_2 > 50000000 then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1133", "tooldrop_by_remote_access_tool")
  return mp.INFECTED
end
do
  return mp.CLEAN
end

