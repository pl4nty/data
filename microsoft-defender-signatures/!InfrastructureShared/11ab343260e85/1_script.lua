-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11ab343260e85\1_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" then
    local l_0_0 = (this_sigattrlog[4]).utf8p1
    if SuspMacPathsToMonitor(l_0_0, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

