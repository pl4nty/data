-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d0b33968ca36\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
if not (this_sigattrlog[2]).matched and not (this_sigattrlog[3]).matched then
  return mp.CLEAN
end
if (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1 = (mp.GetExecutablesFromCommandLine)(l_0_0)
  if l_0_1 then
    for l_0_5,l_0_6 in ipairs(l_0_1) do
      l_0_6 = (mp.ContextualExpandEnvironmentVariables)(l_0_6)
      if (sysio.IsFileExists)(l_0_6) then
        (bm.add_related_file)(l_0_6)
      end
    end
  end
end
do
  l_0_0 = add_parents
  l_0_0()
  l_0_0 = TrackPidAndTechniqueBM
  l_0_1 = "BM"
  l_0_0(l_0_1, "T1546.015", "COMHijacking")
  l_0_0 = mp
  l_0_0 = l_0_0.INFECTED
  return l_0_0
end

